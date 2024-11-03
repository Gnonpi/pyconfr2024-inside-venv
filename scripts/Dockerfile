FROM ubuntu:latest

RUN apt update && \
    apt install --no-install-recommends -y curl git python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/project
WORKDIR /tmp/project
COPY scripts/ /tmp/scripts
