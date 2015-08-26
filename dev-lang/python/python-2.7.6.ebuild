EAPI="5"

DESCRIPTION="An interpreted, interactive, object-oriented programming language"
HOMEPAGE="http://www.python.org/"
SRC_URI=""

PMV=2.7 # Python Major Version
SLOT="${PMV}/0"
IUSE="+threads"
KEYWORDS="~amd64-linux"

src_unpack() {
	mkdir -p ${S}
}

pkg_pretend() {
	test -e /usr/bin/python${PMV} || die "Missing /usr/bin/python${PMV}, can't link to system Python"
	/usr/bin/python${PMV} -c "import sys; exit(sys.version_info[2] < int(\"${PV}\"[4:]))" || die "Python should be ${PV} or newer"
        use threads && /usr/bin/python${PMV} -m threading || die "Python must support threads"
}

src_install() {
	mkdir -p ${ED}/usr/bin
	cat >${ED}/usr/bin/python${PMV} << EOF
#!${EPREFIX}/bin/bash

export PYTHONPATH="${EPREFIX}/usr/lib/python${PMV}/site-packages:\$PYTHONPATH"
exec /usr/bin/python${PMV} "\$@"
EOF
	chmod oug=rx ${ED}/usr/bin/python${PMV}

	mkdir -p ${ED}/lib/python${PMV}/site-packages
	touch ${ED}/lib/python${PMV}/site-packages/.keep
}
