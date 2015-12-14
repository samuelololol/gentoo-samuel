# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/bash



EAPI=5

inherit git-2

DESCRIPTION="Shairport Sync is an AirPlay audio player"
HOMEPAGE="https://github.com/mikebrady/shairport-sync"
EGIT_REPO_URI="https://github.com/mikebrady/shairport-sync"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="avahi pulseaudio ssl metadata"

DEPEND="dev-libs/libconfig \
	    avahi? ( net-dns/avahi ) \
		pulseaudio? ( media-sound/pulseaudio ) \
		ssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}"
src_configure(){
	econf --with-alsa \
	$(! use avahi && echo --with_avahi ) \
	$(! use ssl && echo --with_ssl=openssl ) 
}

src_install(){
	emake PREFIX="${D}" install
			
	doinitd ${FILESDIR}/init.d/shairport
	doconfd ${FILESDIR}/conf.d/shairport
}
