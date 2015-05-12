# @ECLASS: chisel.eclass
# @BLURB: Default build and install functions for Chisel packages.
# @DESCRIPTION:
# This eclass contains functions to build and install Chisel packages.
# This provides src_compile, src_test, and src_install. The ebuild inheriting
# this should provide the src_unpack and src_prepare functions.
#
# The default (supported) workflows use the git-r3 eclass for fetching code and
# defines only EGIT_REPO_URI and EGIT_COMMIT.
# These restrictions make automated processing of ebuilds easier (if necessary
# in the future) as well as eliminate arbitrary code (for maximum cross
# platform compatibility - I'm looking at you, bash).
#
# ebuilds may also define SCALACOPTS, which is a list of options passed to the
# scalac compiler.
#
# @EXAMPLE:
# inherit chisel

EXPORT_FUNCTIONS src_compile src_test src_install

# Working directory for this package
PKGWORKDIR=${WORKDIR}/${P}
# Build directory for this package
PKGBUILDDIR=${PKGWORKDIR}/build

# Libraries directory in temporary destination
DSTLIBDIR=${D}/chisel-libs

# @FUNCTION: chisel_src_compile
# @DESCRIPTION:
# Compiles the Chisel Scala code, generating a jarfile.
chisel_src_compile() {
	python chiselc --sourceDir ${PKGWORKDIR} --buildDir ${PKGBUILDDIR} --pkgconfigDir ${DSTLIBDIR} --dependencies ${DEPENDS} --scalacOptions ${SCALACOPTS} --outputJar ${PKGBUILDDIR}/${P}.jar
}

# @FUNCTION: chisel_src_test
# @DESCRIPTION:
# Runs any tests written with the Chisel testing frameworks.
chisel_src_test() {
# TODO: WRITE ME
}

# @FUNCTION: chisel_src_install
# @DESCRIPTION:
# Installs the package, copying the jarfile to the global repository and
# generating any necessary package descriptors.
chisel_src_install() {
	mkdir -p ${D}/chisel-libs
	cp ${PKGBUILDDIR}/${P}.jar ${DSTLIBDIR}
	# TODO: support more dependencies
	python chiselpkgdef --packageName ${PN} --packageVersion ${PV} --dependencies ${DEPENDS} --scalacOptions ${SCALACOPTS} --outputFile ${DSTLIBDIR}/${P}.pc
}

