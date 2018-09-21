FROM alpine:latest

RUN apk --no-cache add maven curl tar gzip bash

#
# Install JDK
#
# Using the official JDK link does not work with docker cloud build (fails with socket close during download),
# hence we get the jdk from a private repository.
# Other users of this file are encouraged to replace the jdk link below with the official link:
#   https://download.java.net/java/early_access/alpine/28/binaries/openjdk-11+28_linux-x64-musl_bin.tar.gz
ADD "https://storage.googleapis.com/ssb-jdk-mirror/openjdk-11%2B28_linux-x64-musl_bin.tar.gz" /jdk.tar.gz
RUN mkdir -p /opt/jdk && tar xzf /jdk.tar.gz --strip-components=1 -C /opt/jdk
ENV PATH=/opt/jdk/bin:$PATH
ENV JAVA_HOME=/opt/jdk
