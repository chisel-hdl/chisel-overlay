EAPI="5"

inherit chisel

DESCRIPTION="Constructing Hardware in a Scala Embedded Language"
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SLOT="${PV}/0"
KEYWORDS="amd64 ~amd64-linux"
SRC_URI="https://github.com/ucb-bar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

RESOURCES_SUBPATH="src/main/resources"
SCALACOPTS="deprecation feature language:reflectiveCalls language:implicitConversions language:existentials"
