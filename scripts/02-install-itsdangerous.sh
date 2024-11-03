#!/bin/bash

PKG_NAME="itsdangerous-2.2.0"
PKG_TAR_NAME=$PKG_NAME".tar.gz"
PKG_TAR_URL="https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d/itsdangerous-2.2.0.tar.gz"
wget $PKG_TAR_URL
tar -xzf $PKG_TAR_NAME
cp -R $PKG_NAME/src/itsdangerous venvnopip/lib/python3.10/site-packages/itsdangerous
tree -L 5 venvnopip

venvnopip/bin/python -c "import itsdangerous; print(dir(itsdangerous))"
