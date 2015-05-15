EAPI="5"

inherit git-r3 

DESCRIPTION="Wrapper scripts and toolchain for Chisel HDL"
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SRC_URI=""
SLOT="${PV}/0"
KEYWORDS="~amd64-linux"

EGIT_REPO_URI="git@github.com:ducky64/chiselc.git"

src_install() {
	mkdir -p ${ED}/opt/chiselc
	cp -r ${WORKDIR}/${P}/* ${ED}/opt/chiselc

	mkdir -p ${ED}/usr/bin
	cat >${ED}/usr/bin/chiselc << EOF
#!${EPREFIX}/bin/bash
exec ${EPREFIX}/opt/chiselc/chiselc.py "\$@"
EOF
	chmod oug=rx ${ED}/usr/bin/chiselc
}

