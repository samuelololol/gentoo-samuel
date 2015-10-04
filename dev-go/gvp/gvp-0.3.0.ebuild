# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash
EAPI=5
inherit git-r3 autotools

DESCRIPTION="Go Versioning Packager"
HOMEPAGE="https://github.com/pote/gvp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pote/gvp"
#EGIT_COMMIT="9bcab74540a9496480190594c605fd46c7d6d76b"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_configure(){
	./configure --prefix=/usr --infodir=/usr/share/info --datadir=/usr/share --sysconfdir=/etc --localstatedir=/var/lib --libdir=/usr/lib64
}

src_compile(){
    emake || die
}

src_install(){
	export prefix=${D}
    emake DEST="${D}" install || die
}


#TODO
#postinst
#postrm
