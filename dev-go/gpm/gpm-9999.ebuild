# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash
EAPI=5
inherit git-2 autotools

DESCRIPTION="Go Package Manager"
HOMEPAGE="https://github.com/pote/gpm"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pote/gpm"

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
