FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:b1eb0bc264171aa776382288bb41547a0182762571d37ee66c3c52f09bf392f3

COPY --chmod=0644 rootfs/ /

RUN dnf config-manager setopt fedora-cisco-openh264.enabled=1 && \
    dnf -y install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
        fastfetch \
        gnome-console \
        steam-devices && \
    dnf -y remove \
        gnome-shell-extension-apps-menu \
        gnome-shell-extension-launch-new-instance \
        gnome-shell-extension-places-menu \
        gnome-shell-extension-window-list \
        gnome-shell-extension-background-logo \
        firefox-langpacks \
        firefox && \
    dnf -y clean all && \
    systemctl enable flatpak-add-flathub-repo.service

RUN bootc container lint
