FROM lopsided/archlinux:devel AS archlinux-builder
RUN useradd -m builder
RUN echo "%builder ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder-sudo
WORKDIR /home/builder
ENV BUILDDIR=/home/builder/build \
    PKGDEST=/home/builder/packages \
		SRCDEST=/home/builder/sources \
		SRCPKGDEST=/home/builder/srcpackages \
		LOGDEST=/home/builder/logs
USER builder

FROM archlinux-builder AS archlinux-builder-plugin
COPY plugin.sh /home/builder/.local/bin/
ENTRYPOINT /home/builder/.local/bin/plugin.sh
