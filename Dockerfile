FROM debian as builder
WORKDIR /
ARG VERSION=1.1.1d
RUN apt-get update && \
    apt-get install -y build-essential
ADD https://www.openssl.org/source/openssl-${VERSION}.tar.gz /
RUN tar -xf  openssl-${VERSION}.tar.gz
WORKDIR /openssl-${VERSION}
RUN  ./config \
       --prefix=/opt/openssl && \
     make && \
     make test && \
     make install

FROM debian as deployer
ARG VERSION=1.1.1d
ENV LD_LIBRARY_PATH=/opt/openssl/lib
COPY --from=builder /opt/openssl /opt/openssl
RUN ln -s /opt/openssl/bin/openssl /usr/local/bin/openssl
WORKDIR /
ENTRYPOINT ["/opt/openssl/bin/openssl"]
CMD ["help"]
