EAPI="5"

inherit git-r3 chisel

DESCRIPTION="A hardware construction language supporting advanced design using highly parameterized generators and layered domain-specific hardware languages."
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SLOT="${PV}/0"

DEPEND="=dev-chisel/junit-4.12"

EGIT_REPO_URI="git@github.com:ucb-bar/chisel.git"
EGIT_COMMIT="v${PV}"

SCALACOPTS="deprecation feature language:reflectiveCalls language:implicitConversions language:existentials"

