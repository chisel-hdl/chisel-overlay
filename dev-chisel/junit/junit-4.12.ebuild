EAPI="5"

inherit chisel-jar

DESCRIPTION="JUnit is a simple framework to write repeatable tests. It is an instance of the xUnit architecture for unit testing frameworks."
HOMEPAGE="http://junit.org/"
SLOT="${PV}/0"
KEYWORDS="~*"

DEPEND="=dev-chisel/hamcrest-core-1.3"

SRC_URI="https://search.maven.org/remotecontent?filepath=junit/junit/${PV}/junit-${PV}.jar"
