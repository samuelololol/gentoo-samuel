# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="VIM alias, vi->vim, vim->nvim"
HOMEPAGE="https://github.com/samuelololol/gentoo-samuel"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-editors/neovim
		app-editors/vim"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	#check if file already exist
    elog "verify if target path conflict ..."
	[[ ! -f "${D}/usr/local/bin/vi" ]] || die "/usr/local/bin/vi exists!"
	[[ ! -f "${D}/usr/local/bin/vim" ]] || die "/usr/local/bin/vim exists!"

	#install scripts
	elog "create folder /usr/local/bin ..."
	dodir /usr/local/bin

	elog "install scripts ..."
	cp "${FILESDIR}"/vi "${D}usr/local/bin/" || die "Install vi fail"
	cp "${FILESDIR}"/vim "${D}usr/local/bin/" || die "Install vim fail"
}
