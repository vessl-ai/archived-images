#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

if [[ -n "${JUPYTER_ENABLE_LAB}" ]]; then
  jupyter lab --NotebookApp.ip=0.0.0.0 --NotebookApp.token=${VESSL_TOKEN} --NotebookApp.base_url=${VESSL_BASE_URL} --NotebookApp.allow_origin=* --no-browser "$@" --allow-root
else
  jupyter notebook --NotebookApp.ip=0.0.0.0 --NotebookApp.token=${VESSL_TOKEN} --NotebookApp.base_url=${VESSL_BASE_URL} --NotebookApp.allow_origin=* --no-browser "$@" --allow-root
fi
