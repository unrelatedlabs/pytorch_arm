FROM arm32v7/debian:buster-slim

RUN apt update && apt install -y libopenblas-dev libblas-dev m4 cmake cython python3-dev python3-yaml python3-setuptools  g++ vim git
WORKDIR /pytorch
RUN git clone --recursive https://github.com/pytorch/pytorch --branch=v1.4.0 /pytorch

ENV USE_CUDA=0
ENV USE_DISTRIBUTED=0
ENV USE_MKLDNN=0
ENV USE_NNPACK=1
ENV USE_QNNPACK=1

RUN python3 setup.py build


