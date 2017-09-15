#!/usr/bin/env bash

set -e

pytest

cd aws/

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
	case "${TRAVIS_BRANCH}" in
		"next")
			aws configure set aws_access_key_id "${TRAVIS_AWS_ACCESS_KEY_ID}"
			aws configure set aws_secret_access_key "${TRAVIS_AWS_SECRET_KEY_ID}"
			aws configure set region ap-southeast-2
			./deploy.sh dev auscors-terraform-state-dev
		;;
		"master")
			aws configure set aws_access_key_id "${TRAVIS_AWS_ACCESS_KEY_ID}"
			aws configure set aws_secret_access_key "${TRAVIS_AWS_SECRET_KEY_ID}"
			aws configure set region ap-southeast-2
			./deploy.sh test auscors-terraform-state-dev
		;;
		"prod")
			aws configure set aws_access_key_id "${TRAVIS_AWS_ACCESS_KEY_ID_PROD}"
			aws configure set aws_secret_access_key "${TRAVIS_AWS_SECRET_KEY_ID_PROD}"
			aws configure set region ap-southeast-2
			./deploy.sh prod auscors-terraform-state-prod
		;;
	esac
fi