# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash
EAPI=5
inherit git-2 autotools

DESCRIPTION="gpm is a minimalist package manager for Go that leverages the power
of the \`go get\` command and the underlying version control systems used by it to
set your Go dependencies to desired versions, thus allowing easily reproducible
builds in your Go projects.

Go Package Manager makes no assumptions about your dependencies and supports
Git, Bazaar and Mercurial hosted Go packages, for a smoother workflow be sure to
check out \`gvp\` - the Go Versioning Packager which provides dependency isolation
for your projects."
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
