#syntax = docker/dockerfile:1.2
FROM --platform=linux/amd64 condaforge/mambaforge:latest

# prevent installation deletion
RUN rm -f /etc/apt/apt.conf.d/docker-clean

# set timezone and noninteractive mode
ENV TZ=America/New_York
ENV DEBIAN_FRONTEND noninteractive

# install system dependencies
RUN --mount=type=cache,target=/var/cache/apt \
	apt-get update \ 
    && apt-get install -y git \ 
    && apt-get install -y build-essential \ 
    && apt-get install -y libx11-dev \ 
    && apt-get install -y cmake --no-install-recommends \ 
    && apt-get install -y qt5-default

# create environment
COPY environment.yml .
RUN --mount=type=cache,target=/opt/conda/pkgs mamba env create -f environment.yml
RUN rm environment.yml