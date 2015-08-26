EAPI="5"

DESCRIPTION="The Scala Programming Language"
HOMEPAGE="http://www.scala-lang.org/"
SLOT="2.11"
KEYWORDS="amd64-linux ~amd64-linux"

version_tools=(
    scala
    scalac
)

pkg_pretend() {
	for vt in "${version_tools[@]}"
	do
		$vt-${SLOT} -version 2>&1 | grep -q "${PV}" || die "${vt} version must be ${PV}"
	done
}

src_unpack() {
	mkdir -p ${S}
}

src_install() {
	mkdir -p ${ED}/usr/bin
	for t in "${tools[@]}"
	do
		ln -s `which ${t}-${SLOT}` ${ED}/usr/bin/${t}
	done
}
