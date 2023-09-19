#syntax = docker/dockerfile:1.2
FROM condaforge/mambaforge:latest

# prevent installation deletion
RUN rm -f /etc/apt/apt.conf.d/docker-clean

# install system dependencies
RUN --mount=type=cache,target=/var/cache/apt \
	apt-get update \ 
    && apt-get install -y git

# create environment
COPY environment.yml .
RUN --mount=type=cache,target=/opt/conda/pkgs mamba env create -f environment.yml
RUN rm environment.yml