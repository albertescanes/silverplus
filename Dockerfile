FROM scratch AS staging

COPY --chmod=0755 run.sh /

FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:8e50f9939dfd148492e691455850ba51275b233822b429daecc9c63e9c6b908e

RUN --mount=type=bind,from=staging,source=/,target=/build \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /build/run.sh

RUN bootc container lint
