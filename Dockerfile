FROM i386/ubuntu:trusty
ENTRYPOINT ["linux32", "--"]

COPY build.sh /build.sh

RUN /build.sh
