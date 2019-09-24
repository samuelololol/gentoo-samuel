# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils toolchain-funcs flag-o-matic git-r3

DESCRIPTION="HIME Input Method Editor"
HOMEPAGE="http://hime.luna.com.tw/"
EGIT_REPO_URI="https://github.com/${PN}-ime/${PN}"
EGIT_COMMIT="5d21f581fe06dbfc20f302b197d935d317a5d840"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="filter-nobopomofo anthy chewing gtk3 qt4 qt5"

DEPEND=">=x11-libs/gtk+-2
	anthy? ( >=app-i18n/anthy-9100 )
	chewing? ( dev-libs/libchewing )
	gtk3? ( x11-libs/gtk+:3 )
	qt4? ( dev-qt/qtcore:4 dev-qt/qtgui )
	qt5? ( dev-qt/qtcore:5 dev-qt/qtgui )"
RDEPEND="${DEPEND}"
DEPEND="${DEPEND}
	virtual/pkgconfig
	sys-devel/gettext"

RESTRICT="mirror"
S=${WORKDIR}/${P/_/.}

src_prepare() {
	echo "${P}" > ${S}/VERSION.hime
}

src_configure() {
	econf --use_i18n=Y \
		--use_tsin=Y \
		--use_qt3=N \
		$(! use anthy && echo --use_anthy=N ) \
		$(! use chewing && echo --use_chewing=N ) \
		$(! use qt4 && echo --use_qt4=N ) \
		$(! use qt5 && echo --use_qt5=N ) \
		$(! use gtk3 && echo --use_gtk3=N )
}

src_compile() {
	filter-ldflags "-Wl,--as-needed"
	MAKEOPTS="${MAKEOPTS} -j1" emake CC="$(tc-getCC)" || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	if use filter-nobopomofo ; then
		insinto /usr/share/pixmaps/hime
		doins "${FILESDIR}"/nobopomofo/{SS1135_ST,SS1208_DT}.jpg || die
		exeinto /usr/share/hime/script
		doexe "${FILESDIR}"/nobopomofo/hime-filter-nobopomofo || die
		doenvd "${FILESDIR}"/nobopomofo/99hime-filter-nobopomofo || die
	fi
}
