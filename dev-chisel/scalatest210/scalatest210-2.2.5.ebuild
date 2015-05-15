EAPI="5"

inherit chisel-jar

DESCRIPTION="Testing framework for Scala"
HOMEPAGE="http://www.scalatest.org/"
SLOT="${PV}/0"
KEYWORDS="~*"

SRC_URI="https://oss.sonatype.org/content/groups/public/org/scalatest/scalatest_2.10/${PV}/scalatest_2.10-${PV}.jar -> ${P}.jar"

