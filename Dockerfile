FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:673c413ad6f25e83917cb0dcb9cc397fec50469818598d052f941046e0d5ce45

#COPY --chmod=0644 rootfs/ /

RUN dnf config-manager setopt fedora-cisco-openh264.enabled=1 && \
    dnf -y install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
        fastfetch \
        gnome-console \
        steam-devices \
        ffmpegthumbnailer && \
    dnf -y swap \
        ffmpeg-free ffmpeg --allowerasing
    dnf -y remove \
        gnome-shell-extension-apps-menu \
        gnome-shell-extension-launch-new-instance \
        gnome-shell-extension-places-menu \
        gnome-shell-extension-window-list \
        gnome-shell-extension-background-logo \
        firefox-langpacks \
        firefox && \
    dnf -y clean all
    #systemctl enable flatpak-add-flathub-repo.service

RUN bootc container lint
