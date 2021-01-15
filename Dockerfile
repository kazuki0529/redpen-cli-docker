FROM openjdk:11-jre-buster

ARG REDPEN_VERSION='1.10.4'

ENV PATH="$PATH:/usr/local/bin"

# Install redpen
# see: https://redpen.cc/docs/latest/index_ja.html の実行例
RUN cd /tmp \
 && wget -q https://github.com/redpen-cc/redpen/releases/download/redpen-${REDPEN_VERSION}/redpen-${REDPEN_VERSION}.tar.gz -O - | tar xz \
 && cp -av ./redpen-*/* /usr/local/ \
 && rm -rf ./redpen-*

WORKDIR /documents
VOLUME ["/documents"]

ENTRYPOINT ["/usr/local/bin/redpen"]
