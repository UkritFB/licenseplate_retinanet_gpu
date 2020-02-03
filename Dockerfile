FROM tensorflow/tensorflow:2.0.0-gpu-py3

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt install -y libsm6 libxext6 libxrender-dev

RUN git clone https://github.com/fizyr/keras-retinanet.git
RUN cd keras-retinanet
RUN pip install .
RUN  python setup.py build_ext
RUN cd ..
RUN rm -rf keras-retinanet
