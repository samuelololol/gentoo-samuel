# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="migu font collection"
HOMEPAGE="http://mix-mplus-ipa.osdn.jp/migu/"
#SRC_URI="https://github.com/samuelololol/gentoo-samuel/raw/master/media-fonts/${PN}/files/${P}.tbz2"
SRC_URI="https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/migu-1p-${PVR}.zip
		 https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/migu-1c-${PVR}.zip
		 https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/migu-1m-${PVR}.zip
		 https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/migu-2m-${PVR}.zip"

LICENSE="IPA-1.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="binchecks strip"

S=${WORKDIR}
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	unpack ${A}
	find . -name "*.${FONT_SUFFIX}" -exec cp {} . \;
}

src_install() {
	font_src_install
}
