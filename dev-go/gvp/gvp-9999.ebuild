# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash

#!/bin/bash


EAPI=5
inherit git-2 autotools

DESCRIPTION="gvp stands for Go Versioning Packager and is based on gst a similar
tool that provides dependency isolation for Ruby gems.

The tool modifies your \`GOPATH\` to point to a local \`.godeps/\` directory so that you
can keep the dependencies of your project isolated there, it also modifies \`GOBIN\`
and \`PATH\` to include the new GOPATH/bin directory.

gvp is a companion tool to gpm but both tools can be used independently from
each other."
HOMEPAGE="https://github.com/pote/gvp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pote/gvp"

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
