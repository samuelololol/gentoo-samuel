# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A font family from Google designed to cover all the scripts encoded in Unicode"
HOMEPAGE="https://code.google.com/p/noto/"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

FONT_SUFFIX="otf ttf"

src_unpack(){
	echo "Download from http://www.google.com/get/noto/pkgs/Noto-hinted.zip"
	echo "Download the latest noto..."
	SRC_URI_ROOT="http://www.google.com/get/noto/pkgs/"
	src_file="Noto-hinted.zip"
	wget ${SRC_URI_ROOT}/${src_file}
	unpack ./${src_file}
}
