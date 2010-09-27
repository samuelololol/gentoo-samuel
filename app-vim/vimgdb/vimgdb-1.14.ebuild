# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils vim-plugin

DESCRIPTION="vimGdb runtime files"
HOMEPAGE="http://clewn.sourceforge.net/index.html"
SRC_URI="mirror://sourceforge/clewn/vimgdb72-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="|| ( >=app-editors/vim-7.2
	>=app-editors/gvim-7.2 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

#pkg_setup() {
#	if ! built_with_use app-editors/vim gdb ; then
#		eerror "Please (re)emerge vim with gdb USE flag"
#		die
#	fi
#}

src_unpack() {
	unpack vimgdb72-${PV}.tar.gz
	cd "${S}"

	# Extract the internal tarball.
	tar -xzf vimgdb_runtime.tgz

	# Don't call Toggle() on start
	sed -i \
		-e 's/^call/" call/' \
		macros/gdb_mappings.vim || die "sed failed"
}

pkg_postinst() {
	elog "gdb mappings toggle key is F7 by default"
	elog "see ${ROOT}usr/share/vim/vimfiles/macros/gdb_mappings.vim"
}

