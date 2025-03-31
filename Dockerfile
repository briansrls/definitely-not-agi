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
  latexmk \
  make \
  git \
  ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Configure Git SSL settings
RUN git config --global http.sslCAinfo || echo "No CA info set." && \
  update-ca-certificates && \
  git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt

# Set working directory
WORKDIR /github/workspace
