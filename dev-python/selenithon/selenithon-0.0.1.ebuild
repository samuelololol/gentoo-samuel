# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# PYTHON_COMPAT=(python2_7)
# inherit distutils-r1

DESCRIPTION="AWS CLI tool based on docker container"
HOMEPAGE="https://github.com/samuelololol/selenithon"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/python:2.7
		app-emulation/docker
		dev-python/virtualenvwrapper"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
QA_PREBUILD="/opt/${PN}"

src_install() {
    elog "check samuelololol/selenithon image exist"
    if [[ "$(docker images -q samuelololol/selenithon:latest 2> /dev/null)" == "" ]]; then
        elog "pulling samuelololol/selenithon image from docker hub"
        docker pull samuelololol/selenithon || die
        elog "samuelololol/selenithon image pulled"
    fi

    #install binary
    dodir "/opt/tools/${PN}/bin"
    cp "${FILESDIR}"/selenithon "${D}/opt/tools/${PN}/bin" || die "Install fail"

    #install config
    doconfd "${FILESDIR}"/selenithon.env || die "install config fail"

    #install symlink
    dosym /opt/tools/${PN}/bin/selenithon /usr/local/bin/selenithon || die "dosym fail"
}
