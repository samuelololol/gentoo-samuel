# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

#!/bin/bash


EAPI=4

DESCRIPTION="Powerfull Python and Django IDE similar to IntelliJ IDEA"
HOMEPAGE="http://jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"

LICENSE="|| ( PyCharm-commercial
              PyCharm-academic 
			  PyCharm-classroom
			  PyCharm-opensource )"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip"

DEPEND=">=virtual/jdk-1.6"
RDEPEND="${DEPEND}"

src_install() {
    local dir="/opt/${P}"
    insinto "${dir}"
    doins -r *
    fperms 755 "${dir}/bin/${PN}.sh"
    newicon "bin/PyCharm_128.png" ${PN}.png
    dodir /usr/bin

    make_wrapper "${PN}" "/opt/${P}/bin/${PN}.sh"
    make_desktop_entry ${PN} "PyCharm ${PV}" ${PN} "Development;IDE"
}
