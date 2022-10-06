This is a seperate repo for models based on `Detectron 2`. `Detectron 2` and `YOLOv5 multi-GPU` have conflicts in system requirements. YOLO models are at: https://github.com/running-man-01/trashai_nbs.

## STEP 0. Boot up machine

Start a local or remote `Ubuntu 20.04 LTS` machine with one or more GPU's.

Go to: https://www.nvidia.com/Download/index.aspx and find the appropriate GPU driver for your machine. 


## STEP 1. install necessary dependencies
```
sudo apt update && sudo apt install git wget curl python3-pip -y
```


## STEP 2. start a docker container
```
wget https://raw.githubusercontent.com/running-man-01/trashai_nbs_d2/main/starter.sh && bash starter.sh
```

## STEP 3. deploy docker container
```
sudo docker run --ipc=host -it -p 8888:8888 nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
```

## STEP 4. in docker container, start a jupyter lab

4.1 install dependencies
```
apt update && apt install git wget curl python3-pip unzip -y && \
pip install --upgrade pip && \
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get install ffmpeg libsm6 libxext6  -y && pip install opencv-contrib-python && \
pip install --user torch==1.10 torchvision==0.11.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html && \
pip install --upgrade jupyterlab pandas seaborn gdown jupyter ipywidgets
```

4.2 install `Detectron 2`. This step fails randomly so we do it manually. Repeat with patience if needed.
```
python3 -m pip install 'git+https://github.com/facebookresearch/detectron2.git'
```

4.3 start a jupyter lab

```
git clone https://github.com/running-man-01/trashai_nbs_d2 && \
cd trashai_nbs_d2 && \
jupyter-lab --generate-config && \
echo 'c.NotebookApp.allow_origin = "*"' >> /root/.jupyter/jupyter_notebook_config.py && \
echo 'c.NotebookApp.ip = "0.0.0.0"'>> /root/.jupyter/jupyter_notebook_config.py && \
jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```


So far, the environment has been set up. You can go to the Jupyter Lab link pops up in the terminal.

Open Jupyter Notebooks you want to review in Jupyter Lab.
![lab](https://raw.githubusercontent.com/running-man-01/trashai_nbs/main/jlab.png)
