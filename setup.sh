#!/usr/bin/env bash
set -e

# Update package lists
apt-get update

# Install system dependencies
apt-get install -y python3.9 python3.9-venv python3.9-dev bzip2 tmux git git-lfs libglu1-mesa-dev
apt update
apt install -y \
    libgl1 \
    libegl1 \
    libosmesa6 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxi6 \
    libxkbcommon0 \
    libxrandr2 \
    libxcursor1 \
    libxinerama1
  
# Create and activate virtual environment
python3.9 -m venv py39
source py39/bin/activate

# Upgrade pip
pip install --upgrade pip==24.0

# Install Python dependencies
pip install -r ./pre-requirements.txt
pip install -r ./requirements.txt
git lfs install
git clone https://huggingface.co/H-Liu1997/emage_evaltools
