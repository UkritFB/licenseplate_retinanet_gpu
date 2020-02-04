FROM tensorflow/tensorflow:2.0.0-gpu-py3

ADD . /app
WORKDIR /app 

RUN  apt-get update && \
          apt-get upgrade -y && \
          apt-get install -y git

RUN  pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt install -y libsm6 libxext6 libxrender-dev

RUN git clone https://github.com/fizyr/keras-retinanet.git
WORKDIR /app/keras-retinanet 
RUN  ls -lha 
RUN pip install .
RUN  python setup.py build_ext 
WORKDIR /app
RUN  ls -lha 
RUN rm -rf 
