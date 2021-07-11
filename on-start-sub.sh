#!/bin/bash

set -e

sudo -u ec2-user -i <<'EOF'
unset SUDO_UID

WORKING_DIR=/home/ec2-user/SageMaker/custom-miniconda

# Create a custom conda environment
source "$WORKING_DIR/miniconda/bin/activate"
echo ". /home/ec2-user/SageMaker/custom-miniconda/etc/profile.d/conda.sh" >> ~/.bashrc

cd /home/ec2-user/SageMaker/solaris
echo "Creating solaris conda environment"
conda env create -f environment-gpu.yml
