EAPI="5"

DESCRIPTION="Virtual for Java Development Kit (JDK)"
SLOT="1.7"
KEYWORDS="amd64 ~arm ~ia64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

pkg_pretend() {
        javac -version 2>&1 | grep -q "1.7" || die "Java 7 JDK not installed"
}

src_unpack() {
        mkdir -p ${S}
}

src_install() {
        mkdir -p ${ED}/usr/bin
        cat >${ED}/usr/bin/java << EOF
#!${EPREFIX}/bin/bash

exec /usr/bin/java "\$@"
EOF
        chmod oug=rx ${ED}/usr/bin/java
        cat >${ED}/usr/bin/javac << EOF
#!${EPREFIX}/bin/bash

exec /usr/bin/javac "\$@"
EOF
        chmod oug=rx ${ED}/usr/bin/javac
}
