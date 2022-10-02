#!/bin/bash
# this is gonna run a bunch of shit so I don't have to type... wait... type... wait... when launching stable diffusion


echo "Entering stable-diffusion directory"
cd ~/stable-diffusion

CONDA_PATH=$(conda info | grep -i 'base environment' | awk '{print $4}')
source $CONDA_PATH/etc/profile.d/conda.sh
conda activate $MY_ENV

echo "activating ldm via conda."
conda activate ldm

echo "preloading the stable-diffusion content"
python3 scripts/preload_models.py

echo "let's get cracking"
python3 scripts/dream.py