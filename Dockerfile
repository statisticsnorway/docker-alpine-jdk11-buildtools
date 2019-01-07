FROM alpine:latest

RUN apk --no-cache add maven curl tar gzip bash perl git

#
# Install JDK
#

ADD "https://cdn.azul.com/zulu/bin/zulu11.2.3-jdk11.0.1-linux_musl_x64.tar.gz" /jdk.tar.gz
RUN mkdir -p /opt/jdk && tar xzf /jdk.tar.gz --strip-components=1 -C /opt/jdk && rm -f /jdk.tar.gz
ENV PATH=/opt/jdk/bin:$PATH
ENV JAVA_HOME=/opt/jdk
