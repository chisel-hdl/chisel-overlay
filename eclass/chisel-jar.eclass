# @ECLASS: chisel.eclass
# @BLURB: Default build and install functions for a Chisel JAR
# @DESCRIPTION:
# This assumes that the JAR is present in ${WORKDIR}/${P}, downloaded
# by another build stage (like src_unpack).
#
# ebuilds may also define SCALACOPTS, which is a list of options passed to the
# scalac compiler.
#
# @EXAMPLE:
# inherit chiseljar

EXPORT_FUNCTIONS src_unpack src_configure src_compile src_test src_install

# Working directory for this package
PKGWORKDIR=${WORKDIR}/${P}

# Libraries directory in temporary destination
DSTLIBDIR=${ED}/usr/share/chisel/libs

# @FUNCTION: chisel_src_unpack
# @DESCRIPTION:
# Just copy the jarfile to the source directory.
chisel-jar_src_unpack() {
	mkdir -p ${PKGWORKDIR}
	cp ${DISTDIR}/${P}.jar ${PKGWORKDIR}/${P}.jar
}

# @FUNCTION: chisel_src_configure
# @DESCRIPTION:
# This does nothing.
chisel-jar_src_configure() {
	:
}

# @FUNCTION: chisel_src_compile
# @DESCRIPTION:
# This does nothing.
chisel-jar_src_compile() {
	:
}

# @FUNCTION: chisel_src_test
# @DESCRIPTION:
# This does nothing.
chisel-jar_src_test() {
	:
}

# @FUNCTION: chisel_src_install
# @DESCRIPTION:
# Installs the package, copying the jarfile to the global repository and
# generating any necessary package descriptors.
chisel-jar_src_install() {
	mkdir -p ${DSTLIBDIR}
	cp ${PKGWORKDIR}/${P}.jar ${DSTLIBDIR}
}

