# Use the AWS Elastic Beanstalk Python 3.4 image
FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1
MAINTAINER David Karchmer <dkarchmer@ampervue.com>

#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8

ENV YASM_VERSION    1.3.0

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe multiverse >> /etc/apt/sources.list; \
    apt-get update -qq && apt-get install -y --force-yes \
    autoconf \
    automake \
    build-essential \
    cmake \
    curl \
    git \
    libass-dev \
    libgpac-dev \
    libmp3lame-dev \
    libfaac-dev \
    libfontconfig-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libjpeg-dev \
    libpng-dev \
    libpq-dev \
    libtheora-dev \
    libtiff5-dev \
    libtool \
    libvdpau-dev \
    libvorbis-dev \
    mercurial \
    pkg-config \
    postgresql \
    texi2html \
    unzip \
    wget \
    zlib1g-dev; \
    apt-get clean

# Step 1: Build FFMPEG and related plugins
# ----------------------------------------

COPY          build.sh /tmp/build.sh
RUN           bash /tmp/build.sh

# Exposes port 8080
EXPOSE 8080

ENV PYTHONPATH $PYTHONPATH:/var/app
