FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:8e50f9939dfd148492e691455850ba51275b233822b429daecc9c63e9c6b908e

COPY --chmod=0755 run.sh /tmp/run.sh

RUN /tmp/run.sh && \
    bootc container lint
