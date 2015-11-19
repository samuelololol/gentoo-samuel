# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash

#!/bin/bash


EAPI=5
inherit git-r3

DESCRIPTION="BSD licensed charset/encoding converter library with more functionalities than libiconv"
HOMEPAGE="https://github.com/buganini/bsdconv"
SRC_URI=""
EGIT_REPO_URI="https://github.com/buganini/bsdconv"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake || die
}

src_install(){
	emake DEST="${D}" install || die
}
