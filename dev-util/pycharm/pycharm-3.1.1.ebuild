# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

EAPI=4
inherit eutils

DESCRIPTION="Powerfull Python and Django IDE similar to IntelliJ IDEA(Perfessional Version)"
HOMEPAGE="http://jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/pycharm-professional-${PV}.tar.gz"
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
    fperms a+x "${dir}/bin/${PN}.sh"     || die "fperms failed"
    fperms a+x "${dir}/bin/fsnotifier"   || die "fperms failed"
    fperms a+x "${dir}/bin/fsnotifier64" || die "fperms failed"
    fperms a+x "${dir}/bin/inspect.sh"   || die "fperms failed"

	#doicon "${dir}/bin/${PN}.png"
    #dosym /opt/${P}/bin/${PN}.sh /usr/bin/${PN}
    dosym ${dir}/bin/${PN}.sh /usr/bin/${PN}

    make_wrapper "${PN}" "/opt/${P}/bin/${PN}.sh"
    make_desktop_entry ${PN} "PyCharm ${PV}" ${PN} "Development;IDE"
}
