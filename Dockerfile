FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:1f70b4cf86c53c03405bbb1a4c141e3781df465b23eb52be8286647467223b30

COPY --chmod=0755 run.sh /tmp/run.sh

RUN /tmp/run.sh && \
    bootc container lint
