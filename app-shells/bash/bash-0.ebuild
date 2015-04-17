EAPI="5"

DESCRIPTION="The standard GNU Bourne again shell"
HOMEPAGE="http://tiswww.case.edu/php/chet/bash/bashtop.html"
SRC_URI=""
SLOT="0"
IUSE=""
KEYWORDS="~amd64-linux"

src_unpack() {
        mkdir -p ${S}
}

src_install() {
        mkdir -p ${ED}/bin
        ln -s /bin/bash ${ED}/bin/bash
}
