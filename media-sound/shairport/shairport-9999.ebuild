# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash



EAPI=5

inherit git-r3 autotools

DESCRIPTION="Shairport Sync is an AirPlay audio player"
HOMEPAGE="https://github.com/mikebrady/shairport-sync"
EGIT_REPO_URI="https://github.com/mikebrady/shairport-sync"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="avahi pulseaudio ssl metadata"

DEPEND="dev-libs/libconfig \
	    avahi? ( net-dns/avahi ) \
	    ssl? ( dev-libs/openssl ) \
		pulseaudio? ( media-sound/pulseaudio )"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf -i -f
}

src_configure(){
	econf --with-alsa --with-piddir=/var/run \
	$( use avahi && echo --with-avahi ) \
	$( use metadata && echo --with-metadata ) \
	$( use ssl && echo --with-ssl=openssl )
}

src_install(){
	#emake PREFIX="${D}" install
	export prefix=${D}
	export DESTDIR=${D}
    emake DEST="${D}" install || die
	
	doinitd ${FILESDIR}/init.d/shairport
	doconfd ${FILESDIR}/conf.d/shairport
}
