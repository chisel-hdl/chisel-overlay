EAPI="5"

inherit chisel

DESCRIPTION="Constructing Hardware in a Scala Embedded Language"
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SLOT="2/${PV}"
KEYWORDS="amd64 ~amd64-linux"
SRC_URI="https://github.com/ucb-bar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

add_chisel_dependencies
