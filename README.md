[![Build Status](https://travis-ci.org/GeoscienceAustralia/GeodesyMLConverter.svg?branch=master)](https://travis-ci.org/GeoscienceAustralia/GeodesyMLConverter)

# GeodesyML Site Log Converter
Command line tools for converting between GeodesyML site log and text site log formats:

* `sitelog-to-geodesyml`
* `geodesyml-to-sitelog`

## Installation

```bash
pip install -r requirements.txt
pip install .
```

## Tests

``` bash
python setup.py build
python setup.py test
```

## Deployment to AWS Lambda

```bash
cd aws/
./deploy {environment} {terraform-state-bucket}
or environment=dev ./deploy.sh dev
```

## Initialize a bunch of sites in WebService (so that it will be pulled automatically by lambda)

```bash
cd <igs-local-sites-dir>
sudo python -m pyftpdlib -p21 -r60000-63000

# using following steps( change web services url and bucket name, to fit your purpose)
# Not too sure, but better to stick to following import sequence 

# 1. import legacy sites
env gws_url=https://sitelogdev-webservices.geodesy.linz.io \
incoming_bucket_name=sitelogdev-incoming-dev \
python import_site_logs_from_ftp_sites.py -s local -f scopeigs.txt

# 2. IGS current sites
env gws_url=https://sitelogdev-webservices.geodesy.linz.io \
incoming_bucket_name=sitelogdev-incoming-dev \
python import_site_logs_from_ftp_sites.py -s igs -f scopeigs.txt


# Currently scope.txt only has '*', so all sites get imported, even their site name is test_xxx.log, import New Zealand Sites

env gws_url=https://sitelogdev-webservices.geodesy.linz.io \
incoming_bucket_name=sitelogdev-incoming-dev \
python import_site_logs_from_ftp_sites.py -s geonet -f scope.txt

```