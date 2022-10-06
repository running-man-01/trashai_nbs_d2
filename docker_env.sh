#!/bin/bash

apt update && apt install git wget curl python3-pip -y && \
pip install --upgrade pip && \
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get install ffmpeg libsm6 libxext6  -y && pip install opencv-contrib-python && \
pip install --user torch==1.10 torchvision==0.11.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html && \
pip install jupyterlab && \
pip install --upgrade pandas seaborn && \
python3 -m pip install 'git+https://github.com/facebookresearch/detectron2.git' && \
git clone https://github.com/running-man-01/trashai_nbs_d2 && \
cd trashai_nbs_d2 && \
jupyter-lab --generate-config && \
echo 'c.NotebookApp.allow_origin = "*"' >> /root/.jupyter/jupyter_notebook_config.py && \
echo 'c.NotebookApp.ip = "0.0.0.0"'>> /root/.jupyter/jupyter_notebook_config.py && \
jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root