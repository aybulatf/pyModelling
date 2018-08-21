FROM python:3.6-stretch

MAINTAINER Ralf Junghanns <ralf.junghanns@gmail.com>

RUN buildDeps="netcat libgdal-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY . /pymodelling
COPY ./bin/linux/* /usr/local/bin/

RUN pip install pygdal==$(gdal-config --version).*
RUN pip install numpy==1.12.0

WORKDIR /pymodelling

RUN pip install -r requirements.txt
