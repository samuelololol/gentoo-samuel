# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash



EAPI=5

inherit git-r3 autotools

DESCRIPTION="Shairport Sync is an AirPlay audio player"
HOMEPAGE="https://github.com/samuelololol/shairport.git"
EGIT_REPO_URI="https://github.com/samuelololol/shairport.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="avahi pulseaudio ssl metadata"

DEPEND="dev-libs/libconfig \
	    avahi? ( net-dns/avahi ) \
	    ssl? ( dev-libs/openssl ) \
		pulseaudio? ( media-sound/pulseaudio )"
RDEPEND="${DEPEND}"

src_install(){
	prefix=$(D:bin=usr/local/bin)
    emake PREFIX=${D} DESTDIR=/usr/local install || die
	
	doinitd ${FILESDIR}/init.d/shairport
	doconfd ${FILESDIR}/conf.d/shairport
}
