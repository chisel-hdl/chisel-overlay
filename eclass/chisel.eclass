# @ECLASS: chisel.eclass
# @BLURB: Default build and install functions for Chisel packages.
# @DESCRIPTION:
# This eclass contains functions to build and install Chisel packages.
# This provides src_compile, src_test, and src_install while removing other
# install steps which have defaults but are unused. The ebuild inheriting
# this should provide the src_unpack and src_prepare functions - it's expected
# all the sources end up in ${WORKDIR}/${P}/src/main/scala.
#
# The default (supported) workflows use either:
# - The git-r3 eclass for fetching code and defines only EGIT_REPO_URI and 
#   EGIT_COMMIT.
# - Pulling a archive file from SRC_URI, possibly renaming the downloaded file
#   with the -> syntax in SRC_URI.
# These restrictions make automated processing of ebuilds easier (if necessary
# in the future) as well as eliminate arbitrary code (for maximum cross
# platform compatibility - I'm looking at you, bash).
#
# ebuilds may also define:
# - SRC_SUBPATH, the relative path from the repository root where the source 
#   files are located. This defaults to sbt's convention, "src/main/scala".
# - SCALACOPTS, which is a list of options passed to the scalac compiler.
#

EXPORT_FUNCTIONS src_configure src_compile src_test src_install

SRC_SUBPATH="src/main/scala"

add_chisel_dependencies() {
        DEPEND="${DEPEND} sys-devel/pconfigure[scala]"
}

chisel_src_configure() {
        cat >Configfile <<EOF
SRCDIR     = ${SRC_SUBPATH}

LANGUAGES += scala
LIBRARIES += lib${PN}.jar
SOURCES   += main.scala

LANGUAGES += pkgconfig
LIBRARIES += pkgconfig/${PN}.pc
SOURCES   += ${PN}.pc
EOF

        cat > ${SRC_SUBPATH}/${PN}.pc <<EOF
prefix=@@pconfigure_prefix@@
exec_prefix=@@pconfigure_prefix@@
libdir=\${prefix}/@@pconfigure_libdir@@
includedir=\${prefix}/@@pconfigure_hdrdir@@

Name: ${PN}
Description: ${DESCRIPTION}
Version: ${PV}
Libs: -l${PN}
URL: ${HOMEPAGE}
EOF

	pconfigure || die "pconfigure failed"
}

chisel_src_compile() {
        emake
}

chisel_src_test() {
        emake check
}

chisel_src_install() {
	emake install
}
