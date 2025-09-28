#!/usr/bin/env bash
# setup_ds_user_nofrills.sh
# Debian 13 (x86_64) — per-user Miniforge + ds_spark env from environment.yml
# No checks, no conditionals, no prompts.

set -euo pipefail

MINIFORGE_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"
PREFIX="$HOME/miniforge3"
ENV_NAME="ds_spark"

curl -L "$MINIFORGE_URL" -o /tmp/miniforge.sh
bash /tmp/miniforge.sh -b -p "$PREFIX"

source "$PREFIX/etc/profile.d/conda.sh"
conda activate base
conda config --set channel_priority strict
conda install -y -c conda-forge mamba

mamba env create -n "$ENV_NAME" -f environment.yml

conda init bash

conda activate "$ENV_NAME"
python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python ($ENV_NAME)"

echo "Installed Miniforge to: $PREFIX"
echo "Created and activated env: $ENV_NAME"
echo "Jupyter kernel registered: Python ($ENV_NAME)"

