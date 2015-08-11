# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2 autotools

DESCRIPTION="universal-ctags has the objective of continuing the development
from what existed in the Sourceforge area. Github exuberant-ctags repository was
started by Reza Jelveh and was later moved to the universal-ctags organization.

The goal of the project is preparing and maintaining common/unified working
space where people interested in making ctags better can work together."
HOMEPAGE="https://ctags.io/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/universal-ctags/ctags.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} !dev-util/ctags"


src_prepare(){
	eautoreconf
}

pkg_postinst() {
	eselect ctags update
	elog "You can set the version to be started by /usr/bin/ctags through"
	elog "the ctags eselect module. \"man ctags.eselect\" for details."
}

pkg_postrm() {
	eselect ctags update
}
