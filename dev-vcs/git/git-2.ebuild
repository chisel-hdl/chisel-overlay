EAPI="5"

DESCRIPTION=""
SLOT="0"
KEYWORDS="~amd64-linux"

pkg_pretend() {
	${PN} --version | grep -q "^${PN} version ${PV}" || die  "Unable to find ${PN} version ${PV}"
}

src_unpack() {
	mkdir -p ${S}
}

src_install() {
	mkdir -p ${ED}/usr/bin
	ln -s `which ${PN}` ${ED}/usr/bin/${t}
}
