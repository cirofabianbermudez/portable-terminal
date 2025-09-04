#FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04
FROM mcr.microsoft.com/devcontainers/universal:4

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    pdftk-java \
    ghostscript \
    imagemagick \
    gnuplot \
    neovim \
    && rm -rf /var/lib/apt/lists/*
