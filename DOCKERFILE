# Use the ubuntu runtime as a parent image
FROM ubuntu

# Set the working directory to /root
WORKDIR /root

# Copy the current directory contents into the container at /roots
COPY ./nets /root
COPY ./run_test.sh /bin

# Install binaries
RUN apt-get update && \ 
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget \
        --no-check-certificate -P /bin https://projects.laas.fr/twina/files/sift/sift && \
    wget \
        --no-check-certificate -P /bin https://projects.laas.fr/twina/files/linux/twina && \
    chmod a+x /bin/sift /bin/twina /bin/run_test.sh ./benchmark.sh ./twinaluate.sh

# Define environment variable
ENV IPTPN "1"