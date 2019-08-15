#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://fe3304a8.ngrok.io/pull/5d557dc66b0e3018e2afd44e 
fi
./ssg-build.sh
./inject-netlify-identity-widget.js _site
