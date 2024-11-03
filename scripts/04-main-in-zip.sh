#!/bin/bash

cat <<EOF > hello_world.py
def say_hello():
    print("hello potato")
say_hello()
EOF
python .
mv hello_world.py __main__.py
python .
zip myworld.zip __main__.py
python myworld.zip
cat <(echo '#!/usr/bin/env python') myworld.zip > mymodule.exec
chmod u+x mymodule.exec
./mymodule.exec
head -1 mymodule.exec
unzip mymodule.exec

# ---
python3 -m venv venv
venv/bin/pip install pex
venv/bin/pex flask -o flask.pex 
cat <<EOF > mini_server.py
from flask import Flask
app = Flask(__name__)
@app.get("/")
def say_hello():
    print("hello potato")
app.run()
EOF
./flask.pex mini_server.py
head -1 flask.pex
mkdir -p ./flask_pex
unzip -q -d ./flask_pex flask.pex
tree -a -L 2 flask_pex
# ---
# * fichier __main__.py             -> gros script qui charge le venv et lance le script
# * fichier PEX-INFO                -> json d'options et hash
# * fichier __pex__/__init__.py     -> copy of __main__.py? template? 
# * dossier .deps/                  -> wheels of dependencies
# * dossier .bootstrap/pex          -> 
# ---
