# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator
REL=$(get_version_component_range 1-2)
SHORTREL=${REL/#20/}

DESCRIPTION="Provides access to versioned files through a graphical interface and also includes"
HOMEPAGE="https://www.perforce.com"
SRC_URI="amd64? ( ftp://ftp.perforce.com/perforce/r${SHORTREL}/bin.linux26x86_64/p4 \
	-> ${PN}-amd64 )"

LICENSE="perforce"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""
RESTRICT="mirror strip test"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
    cp "${DISTDIR}/${A}" p4
}

src_install() {
	dodir "/opt/${PN}"
	doexe "${D}/opt/${PN}" || die "Install failed!"
	dosym /opt/${PN}/p4 /usr/local/bin/p4 || die "Broken symlink"
}

