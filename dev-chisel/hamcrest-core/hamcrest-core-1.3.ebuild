EAPI="5"

SRC_URI="https://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/${PV}/hamcrest-core-${PV}.jar"

inherit chisel-jar

DESCRIPTION="Provides a library of matcher objects (also known as constraints or predicates) allowing 'match' rules to be defined declaratively, to be used in other frameworks. Typical scenarios include testing frameworks, mocking libraries and UI validation rules."
HOMEPAGE="https://code.google.com/p/hamcrest/"
SLOT="${PV}/0"

