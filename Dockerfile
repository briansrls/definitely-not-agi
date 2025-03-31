FROM ubuntu:22.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install TeXLive and other required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-science \
    git config --global http.sslCAinfo || echo "No CA info set." \
    sudo update-ca-certificates \
    git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt \
    latexmk \
    make \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /github/workspace
