EAPI="5"

PYTHON_COMPAT=( python{2_7,3_4} )

inherit git-r3 python-r1

DESCRIPTION="Wrapper scripts and toolchain for Chisel HDL"
HOMEPAGE="http://github.com/ducky64/chiselc"
SRC_URI=""
EGIT_REPO_URI="git://github.com/ducky64/chiselc.git"

SLOT="${PV}/0"
KEYWORDS="amd64 ~amd64-linux"
LICENSE="BSD"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_install() {
	python_foreach_impl python_newscript ${PN}.py ${PN}
}
