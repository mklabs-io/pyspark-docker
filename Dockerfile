ARG OPENJDK_VERSION=8
FROM openjdk:$OPENJDK_VERSION

ARG PYTHON_VERSION=3.7
ARG PYSPARK_VERSION=2.4.2
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update && apt-get install make

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

RUN conda install python=$PYTHON_VERSION -y
RUN conda init bash
RUN . /root/.bashrc

RUN pip install pyspark==$PYSPARK_VERSION
