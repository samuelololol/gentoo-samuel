# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash
EAPI=5
inherit git-r3 autotools

DESCRIPTION="Go Versioning Packager"
HOMEPAGE="https://github.com/pote/gvp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/samuelololol/gvp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_configure(){
	./configure --prefix=/usr/local
}

src_compile(){
    emake || die
}

src_install(){
	export prefix=${D}
    emake DEST="${D}" install || die
}

