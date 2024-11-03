#!/bin/bash

HTTPX_NAME="httpx-0.27.2"
HTTPX_TAR_NAME=$HTTPX_NAME".tar.gz"
HTTPX_TAR_URL="https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6/httpx-0.27.2.tar.gz"
wget $HTTPX_TAR_URL
tar -xzf $HTTPX_TAR_NAME
mv $HTTPX_NAME/httpx venvnopip/lib/python3.10/site-packages/httpx
tree -L 5 venvnopip

venvnopip/bin/python -c "import httpx; print(dir(httpx))"
