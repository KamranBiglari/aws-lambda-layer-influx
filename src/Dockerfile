FROM public.ecr.aws/lambda/provided:al2
#
# versions
#
ARG INFLUXDB_VERSION=2.7.5
USER root
RUN mkdir -p /opt
WORKDIR /opt
#
# tools
#

RUN yum update -y \
    && yum install -y zip unzip wget tar gzip which pkgconfig \
    && yum group install -y "Development Tools"

#
# redis cli
#

RUN wget -O influxdb2-client.tar.gz https://download.influxdata.com/influxdb/releases/influxdb2-client-${INFLUXDB_VERSION}-linux-amd64.tar.gz
RUN ls -alh
RUN tar -xvzf influxdb2-client.tar.gz 

# cleanup
RUN rm -rf influxdb2-client.tar.gz

#
# create the bundle
#

RUN cd /opt \
    &&  zip -9 -j ../layer.zip /opt/influx \
    && echo "/layer.zip is ready" \
    && ls -alh /layer.zip;

RUN /opt/influx version
WORKDIR /
ENTRYPOINT ["/bin/bash"]