# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils git autotools
EGIT="git.eclass"

DESCRIPTION="This is Linux version of Gyazo written in C by tatofoo stored on github."
HOMEPAGE="http://github.com/tatofoo/gyazo-linux"

# SRC_URI=""
EGIT_REPO_URI="git://github.com/tatofoo/gyazo-linux.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="sys-devel/automake 
sys-devel/automake-wrapper
sys-devel/libtool
dev-vcs/git"
RDEPEND="${DEPEND}"

src_prepare()
{
	eaclocal      || die
	aclocal       || die
	autoheader    || die
	automake -ac  || die
	autoconf      || die
}

src_compile() {
	econf --with-posix-regex
		emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}

