# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

MY_PN=${PN/-bin/}

DESCRIPTION="Official desktop client for ZOOM (binary package)"
HOMEPAGE="https://zoom.us/"
SRC_URI="
	amd64? ( https://zoom.us/client/latest/zoom_x86_64.tar.xz )
"
LICENSE="zoom"
SLOT="0"
KEYWORDS="-* ~amd64"
RDEPEND="
	dev-qt/qtpositioning
	dev-qt/qtscript
	dev-qt/qtwebengine[widgets]
	dev-qt/qtwebchannel[qml]
	dev-qt/qtquickcontrols
	dev-qt/qtquickcontrols2
	dev-qt/qtx11extras
	dev-libs/quazip
	dev-libs/icu
"
DEPEND=""

S=${WORKDIR}/${MY_PN}

QA_PREBUILD="/opt/${MY_PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_install() {
	dodir -r "/opt/${MY_PN}"
	cp -R "${S}/zoom" "${D}/opt/${MY_PN}" || die "Install fail"
	dosym /opt/${MY_PN}/${MY_PN} /usr/local/bin/${MY_PN}
}
