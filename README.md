# A1_EatingOut

Reproducible pipeline:
- Data tracked with **Git LFS** (`data/*.csv`, `data/*.geojson`)
- Notebook executed via **Papermill** through a **DVC** stage
- Outputs in `outputs/`

## Quickstart Guide
```bash

# 0) This environment setup step assumes that you already the right environment installed:
# Set up an environment that contains all necessary packages to run the pipeline such as:
# pip jupyterlab numpy pandas scipy scikit-learn matplotlib seaborn papermill dvc git git-lfs geopandas
# For example, running the environment using conda, "ds_spark" environment, you would run the steps below in your linux home directory:

# Run the install and environment setup script
./setup_ds_env_user.sh

# Load conda into your shell (only needed if not already active)
source "$HOME/miniforge3/etc/profile.d/conda.sh"

# Activate the 'ds_spark' environment
conda activate ds_spark

# Start JupyterLab and make it reachable from other machines
jupyter lab --ip=0.0.0.0 --port=8889 --no-browser

# Launch JupyterLab
jupyter lab

# You can now connect to the Jupyter lab using 
http://<server-hostname-or-ip>:8889

# 1) Clone the repo
git clone https://github.com/AllanWTham/A1_EatingOut.git
cd A1_EatingOut

# 2) Ensure Git LFS pointers are pulled as real files
# After pulling, the A1_EatingOut directory structure will look like below (file size is just indicative):
# ├── [4.0K]  artifacts
# ├── [4.0K]  data
# │   ├── [6.5M]  sydney.geojson
# │   └── [2.6M]  zomato_df_final_data.csv
# ├── [1.0K]  dvc.lock
# ├── [ 552]  dvc.yaml
# ├── [ 532]  environment.yaml
# ├── [4.0K]  notebooks
# │   └── [3.6M]  A1.ipynb
# ├── [4.0K]  outputs
# │   ├── [4.0M]  A1_executed.html
# │   ├── [3.7M]  A1_executed.ipynb
# │   └── [1.3M]  logr_model.pkl
# ├── [   0]  push.err
# ├── [1.9K]  README.md
# ├── [ 131]  requirements.txt
# └── [4.0K]  scripts
#    └── [ 898]  setup_ds_env_user.sh

git lfs install
git lfs pull
tree -sh

# 3) Re-run the pipeline (this will execute A1.ipynb via papermill)
dvc repro
```
