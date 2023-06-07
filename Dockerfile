# Use an official Node.js image as the base
#FROM node:14
FROM cypress/browsers:node14.17.6-slim-chrome100-ff99-edge

LABEL maintainer="Bluefletch" version="0.1.0"

# Set the working directory in the container
WORKDIR /app

# Install required dependencies
RUN apt-get update && \
    apt-get install -y python3-pip

# Install TestRail CLI
RUN pip3 install trcli==1.3.1
