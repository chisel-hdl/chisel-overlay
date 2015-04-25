EAPI="5"

DESCRIPTION="An interpreted, interactive, object-oriented programming language"
HOMEPAGE="http://www.python.org/"
SRC_URI=""
SLOT="${PV}/0"
IUSE=""
KEYWORDS="~amd64-linux"

src_unpack() {
	mkdir -p ${S}
}

src_install() {
	mkdir -p ${ED}/usr/bin
	cat >${ED}/usr/bin/python${PV} << EOF
#!${EPREFIX}/bin/bash

export PYTHONPATH="${EPREFIX}/usr/lib/python${PV}/site-packages:\$PYTHONPATH"
exec /usr/bin/python${PV} "\$@"
EOF
	chmod oug=rx ${ED}/usr/bin/python${PV}

	mkdir -p ${ED}/lib/python${PV}/site-packages
        touch ${ED}/lib/python${PV}/site-packages/.keep
}
