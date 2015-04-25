EAPI="5"

DESCRIPTION="Virtual for Java Development Kit (JDK)"
SLOT="1.7"
KEYWORDS="~amd64-linux"

tools=(
    extcheck
    jar
    java
    javac
    javadoc
    javah
    javap
    jdb
    keytool
    jarsigner
    policytool
    native2ascii
    rmic
    rmiregistry
    rmid
    serialver
    tnameserv
    idlj
    orbd
    servertool
    pack200
    unpack200
    jcmd
    jconsole
    schemagen
    wsgen
    wsimport
    xjc
    jps
    jstat
    jstatd
    jinfo
    jhat
    jmap
    jsadebugd
    jstack
    jrunscript
)

version_tools=(
    java
    javac
)

pkg_pretend() {
	for t in "${tools[@]}"
	do
		which $t > /dev/null || die "Missing tool ${t} from JDK installation"
	done

	for vt in "${version_tools[@]}"
	do
		$vt -version 2>&1 | grep -q "${PV}" || die "${vt} version must be ${PV}"
	done
}

src_unpack() {
	mkdir -p ${S}
}

src_install() {
	mkdir -p ${ED}/usr/bin
	for t in "${tools[@]}"
	do
		ln -s `which ${t}` ${ED}/usr/bin/${t}
	done
}
