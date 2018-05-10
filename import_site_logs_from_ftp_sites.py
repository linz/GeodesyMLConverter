"""
Fetch updated site log files from remote FTP sites and upload them to GWS incoming site log bucket.
"""
from __future__ import print_function
import logging
import datetime
import ftplib
import argparse
import os
import re
import shutil
import tempfile

import sys
import boto3
import dateutil.parser
import requests
from fetch_site_logs_from_ftp_sites import LogHunter, SiteLogFtpSource, gws_list_site_logs, parse_site_log_file_name, WrongDateStrException


import_ftp_sources = { # pylint: disable=invalid-name
    'igs':      [ SiteLogFtpSource('ftp.igs.org',  '/pub/station/log'),     ],
    'geonet':   [ SiteLogFtpSource('161.65.59.67', '/gps/sitelogs/logs'),   ],
    'local':    [ SiteLogFtpSource('127.0.0.1', '/igs'),                       ]
}

logger = logging.getLogger(__name__) # pylint: disable=invalid-name
logger.setLevel(logging.INFO)


class LogImporter(LogHunter):
    site_log_file_name_pattern = re.compile(r'(?P<file_name>\w{4}_\d{8}\.log)', re.IGNORECASE)

    def __init__(self, ftp_sources, current_site_logs, scope):
        super(LogImporter, self).__init__(ftp_sources, current_site_logs)
        self.scope = scope

    def get_site_log_updates(self):
        remote_site_logs = {}

        def collect_remote_file_names(ftp, line):

            match = re.search(type(self).site_log_file_name_pattern, line)

            try:
                four_char_id, _ = parse_site_log_file_name(match.group('file_name'))
            except WrongDateStrException as err:
                logger.warn("Wrong sitelog filename:{}\n {}".format(line, err), exc_info=True)
                return
            except Exception as err:
                logger.warn("Cant't use sitelog:{}\n {}".format(line, err), exc_info=True)
                return

            if '*' in self.scope or four_char_id in self.scope:
                new_sitelog_filename = match.group('file_name')
                _, existing_sitelog_filename = remote_site_logs.get(four_char_id, ('-', '-'))

                if four_char_id in remote_site_logs and new_sitelog_filename > existing_sitelog_filename:
                    remote_site_logs[four_char_id] = (ftp, new_sitelog_filename)
                if four_char_id not in remote_site_logs:
                    remote_site_logs[four_char_id] = (ftp, new_sitelog_filename)

        for ftp in self.ftp_connections:
            try:
                logger.info('Fetching site log listing from ' + ftp.host)
                ftp.retrlines("LIST", lambda line, ftp=ftp: collect_remote_file_names(ftp, line))

            except Exception as err: #pylint: disable=broad-except
                logger.warn(err, exc_info=True)

        return remote_site_logs


if __name__ == '__main__':
    loggerStreamHandler = logging.StreamHandler()
    loggerStreamHandler.setLevel(logging.INFO)
    logger.addHandler(loggerStreamHandler)

    parser = argparse.ArgumentParser(
        description=(
                        'This program helps to load sitelog (text-syntax) unconditionally to incoming_bucket:\n'
                    ),

        usage      =(
                        'export gws_url=https://sitelogdev-webservices.geodesy.linz.io '
                        '\n export incoming_bucket_name=sitelogdev-incoming-dev \n'
                        '\npython import_site_logs_from_ftp_sites.py -s <ftpserver-id> -f <scope-file> [--dry-run]\n '             
                    )
    )
    parser.add_argument(
        '-s',
        dest    =   'ftp_site',
        default =   'geonet',
        help    =   'make your choice from igs, local, and geonet'
    )
    parser.add_argument(
        '-f',
        dest    =   'scope_file',
        help    =   'choose your sitelog code list file (see example from scope.example)'
    )

    parser.add_argument('--dryrun',
                        action='store_true',
                        help    =   'Choose dryrun if you want to confirm about the files to be imported first'
    )

    margs = parser.parse_args()

    ftp_site = margs.ftp_site
    scope_file = margs.scope_file
    if not ftp_site or not scope_file:
        parser.print_help(sys.stderr)
        exit(1)

    with open(scope_file, 'r') as reader:
        stations_scope = [ line.strip().lower() for line in reader.readlines() ]

    logger.info("uploading: {} for {}: total {}".format(str(stations_scope[:25]), ftp_site, len(stations_scope)))
    import_ftp_site_src = import_ftp_sources[ftp_site]

    sitelogImporter = LogImporter(import_ftp_site_src, gws_list_site_logs(), stations_scope)
    s3 = boto3.client('s3')

    def upload_site_log(site_log_file, bucket_name):
        s3.put_object(
            Bucket=bucket_name,
            Key=os.path.split(site_log_file.name)[1],
            Body=site_log_file)

        logger.info('Uploaded ' + os.path.split(site_log_file.name)[1] + ' to s3://' + bucket_name)

    incoming_bucket_name = os.environ['incoming_bucket_name']

    if margs.dryrun:
        sitelogImporter.with_site_log_updates(lambda site_log_file: print(site_log_file))
    else:
        sitelogImporter.with_site_log_updates(lambda site_log_file: upload_site_log(site_log_file, incoming_bucket_name))
