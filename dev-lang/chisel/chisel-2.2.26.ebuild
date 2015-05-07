EAPI="5"

inherit git-r3 chisel

DESCRIPTION="A hardware construction language supporting advanced design using highly parameterized generators and layered domain-specific hardware languages."
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SLOT="${PV}/0"

EGIT_REPO_URI="https://github.com/ucb-bar/chisel.git"
EGIT_COMMIT="v${PV}"

SCALACOPTS="-deprecation -feature -language:reflectiveCalls -language:implicitConversions -language:existentials"

