EAPI="5"

inherit git-r3 chisel

DESCRIPTION="These are the tutorials for Chisel."
SLOT="${PV}/0"
KEYWORDS="amd64 ~amd64-linux"

CHISEL_LIBRARY_DEPENDENCIES="=dev-lang/chisel-2.2.26"

EGIT_REPO_URI="git@github.com:ucb-bar/chisel-tutorial.git"

SRC_SUBPATH="solutions"
JAR_ENTRYPOINT="TutorialSolutions.TutorialSolutions"
