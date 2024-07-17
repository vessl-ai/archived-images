#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

jupyter lab \
  --ServerApp.ip=0.0.0.0 \
  --ServerApp.token=${VESSL_TOKEN} \
  --ServerApp.base_url=${VESSL_BASE_URL} \
  --ServerApp.allow_origin="*" \
  --no-browser "$@" --allow-root