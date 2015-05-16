EAPI="5"

inherit chisel git-r3

DESCRIPTION="Constructing Hardware in a Scala Embedded Language"
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SLOT="${PV}/0"
KEYWORDS="amd64 ~amd64-linux"
EGIT_REPO_URI="git@github.com:ucb-bar/chisel.git"

SCALACOPTS="deprecation feature language:reflectiveCalls language:implicitConversions language:existentials"
