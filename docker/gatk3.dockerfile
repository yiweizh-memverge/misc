FROM anapsix/alpine-java:8

MAINTAINER Gao Wang, gaow@uchicago.edu

WORKDIR /tmp
ENV version 3.8-0
RUN  apk add --update --no-cache ncurses && \
     apk add --virtual=deps --update --no-cache ncurses-dev musl-dev
ADD https://github.com/Miachol/gatk_releases/raw/master/gatk${version}.tar.gz ./
RUN tar -xzvf gatk${version}.tar.gz \
    && mv gatk${version}/GenomeAnalysisTK.jar /opt \
    && chmod 777 /opt/GenomeAnalysisTK.jar \
    && rm -rf /var/cache/apk/* \
    && apk del deps \
    && rm -rf *

# Default command
CMD ["bash"]
