#!/bin/bash

# Must cd into this directory to run this script successfully

# Setup the environment for the classroom. TeachOps FTW!
set -e # Exit immediately if a command exits with a non-zero status
set -x # Exit immediately if a pipeline exits with a non-zero status

# Create environment
conda update -n base conda -y 
conda env create --file environment.yml

# Start environment
source activate ai-session-02

# Update environment (might break stuff. move fast‽)
conda update --all --yes

# Setup spell checking and other notebook enhancements
git clone https://github.com/Calysto/notebook-extensions.git
cd notebook-extensions
jupyter nbextension install calysto --user
jupyter nbextension enable calysto/spell-check/main
jupyter nbextension enable calysto/cell-tools/main
jupyter nbextension enable calysto/annotate/main
rm -r -f notebook-extensions

# Setup RISE (https://github.com/damianavila/RISE) slideshows 
jupyter nbextension install rise --py --sys-prefix
jupyter nbextension enable rise --py --sys-prefix