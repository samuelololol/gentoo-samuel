# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A Script to generate python tags files"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/python:2.7
		dev-util/ctags"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
QA_PREBUILD="/opt/${PN}"

src_install() {
    #install scripts
    dodir "/opt/tools/${PN}/bin"
    cp "${FILESDIR}"/pyctags.sh "${D}/opt/tools/${PN}/bin" || die "Install fail"
    #install symlink
    dosym /opt/tools/${PN}/bin/pyctags.sh /usr/local/bin/pyctags || die "dosym fail"
}
