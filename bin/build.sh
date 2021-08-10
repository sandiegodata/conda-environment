#!/bin/bash 
# Install the conda packages and pip packages, resolve all versions, 
# and export an environment file, using a disposable conda environment. 


# exit when any command fails
set -e

if [ -f ~/opt/anaconda3/etc/profile.d/conda.sh ]
then
	. ~/opt/anaconda3/etc/profile.d/conda.sh
else
	export PATH=~/opt/anaconda3/bin:$PATH 
fi

conda env remove -n _env_build || echo

conda env create  -f requirements/conda-minimal.yaml -n _env_build

conda activate _env_build

pip install -r requirements/requirements.txt

conda deactivate

conda env export -n _env_build | egrep -v '^prefix' | sed 's/_env_build/sdrdl_ds/' > $1



conda env remove -n _env_build