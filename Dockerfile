FROM tensorflow/tensorflow:2.0.0-gpu-py3

ADD . /app
WORKDIR /app 

RUN  apt-get update && \
          apt-get upgrade -y && \
          apt-get install -y git && \
          apt install -y libsm6 libxext6 libxrender-dev

RUN  pip install --upgrade pip && \
          pip install -r requirements.txt 

RUN git clone https://github.com/fizyr/keras-retinanet.git
WORKDIR /app/keras-retinanet 
RUN   pip install . && \
          python setup.py build_ext 

WORKDIR /app
RUN rm -rf keras-retinanet 

