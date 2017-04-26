# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator
REL=$(get_version_component_range 1-2)
SHORTREL=${REL/#20/}

DESCRIPTION="Provides access to versioned files through a graphical interface and also includes"
HOMEPAGE="https://www.perforce.com"
SRC_URI="amd64? ( ftp://ftp.perforce.com/perforce/r${SHORTREL}/bin.linux26x86_64/p4v.tgz \
	-> ${PN}-amd64.tgz )"

LICENSE="perforce"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""
RESTRICT="mirror strip test"

DEPEND="
    dev-qt/qtgui:5
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
    tar zxf "${DISTDIR}/${A}" || die "tar zxf fail"
}

src_install() {
	dodir "/opt/${PN}"
	cp -R * "${D}/opt/${PN}" || die "Install failed!"

	dosym /opt/${PN}/p4v /usr/local/bin/p4v
	dodir /etc/revdep-rebuild
	echo "SEARCH_DIRS_MASK=\"/opt/${PN}\"" > "${ED}/etc/revdep-rebuild/50-perforce-gui"
}

