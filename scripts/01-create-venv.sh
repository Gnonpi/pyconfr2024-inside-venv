#!/bin/bash

echo "> Creating virtualenv"

VENVNAME=myvenv
CURRENT_PYTHON=$(which python)
CURRENT_PYTHON_BIN=$(dirname ${CURRENT_PYTHON})

echo "> Cleanup"
rm -rf ${VENVNAME}

mkdir ${VENVNAME}

echo "> Creating pyvenv.cfg"
# envsubst to replace values
PYVENV_PATTERN="
home = ${CURRENT_PYTHON_BIN}
include-system-site-packages = false
version = 3.12.3
executable = ${CURRENT_PYTHON}
command = ${CURRENT_PYTHON} -m venv /tmp/project/${VENVNAME}
"
echo ${PYVENV_PATTERN} > /tmp/pattern
envsubst < /tmp/pattern > ${VENVNAME}/pyvenv.cfg

echo "> Adding top level dirs"
mkdir -p ${VENVNAME}/bin ${VENVNAME}/include ${VENVNAME}/lib
ln -s lib ${VENVNAME}/lib64

echo "> Adding python links"
ln -s python ${VENVNAME}/bin/python3.12
ln -s python ${VENVNAME}/bin/python3
ln -s ${CURRENT_PYTHON} ${VENVNAME}/bin/python

echo "> Adding pip"
${VENVNAME}/bin/python -m ensurepip --default-pip

echo "> Installing a package, using it"
${VENVNAME}/bin/pip install pandas
${VENVNAME}/bin/python -c 'import pandas as pd; print(pd.DataFrame())'

echo -e "\n\n"

tree -L 5 ${VENVNAME}

