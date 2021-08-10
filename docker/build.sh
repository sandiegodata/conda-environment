#!/bin/bash 
# Install the conda packages and pip packages, resolve all versions, 
# and export an environment file

source /opt/conda/etc/profile.d/conda.sh 

conda env create  -f conda-minimal.yaml -n _env_build

conda activate _env_build

pip install -r requirements.txt

conda env export  | egrep -v '^prefix' | sed 's/_sez_build/sez/' 