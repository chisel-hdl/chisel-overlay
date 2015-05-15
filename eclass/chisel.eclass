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
# - CHISEL_LIBRARY_DEPENDENCIES, which is a list of Chisel library dependencies
#   in Portage DEPEND style. Currently, this MUST have an exact version
#   associated with it (example: "=dev-lang/chisel-2.2.26") because of
#   limitations in chiselc. Note that just using DEPEND will cause compilation
#   to fail since chiselc is not aware of DEPEND.
#
# The use of any other variables are unsupported and updates may break your 
# code.
#
# @EXAMPLE:
# inherit chisel

EXPORT_FUNCTIONS src_configure src_compile src_test src_install

# Working directory for this package
PKGWORKDIR=${WORKDIR}/${P}
SRC_SUBPATH="src/main/scala"
# Build directory for this package
PKGBUILDDIR=${PKGWORKDIR}/build

# Libraries directory in temporary destination
DSTLIBDIR=${ED}/usr/share/chisel/libs

# All Chisel packages need chiselc.  In addition, the user is expected
# to set CHISEL_LIBRARY_DEPENDENCIES to the list of dependencies that
# chiselc is meant to figure out how to deal with.
DEPEND="chisel-util/chiselc ${CHISEL_LIBRARY_DEPENDENCIES}"
RDEPEND="${CHISEL_LIBRARY_DEPENDENCIES}"

# @FUNCTION: chisel_src_configure
# This replaces the default configure (which isn't used) with nothing.
chisel_src_configure() {
	:
}

# @FUNCTION: chisel_src_compile
# @DESCRIPTION:
# Compiles the Chisel Scala code, generating a jarfile.
chisel_src_compile() {
	mkdir -p ${PKGBUILDDIR}
	chiselc ${PKGWORKDIR}/${SRC_SUBPATH} ${PKGBUILDDIR} --portagePkgDepends "${CHISEL_LIBRARY_DEPENDENCIES}" --portagePkgDbDir ${EPREFIX}/var/db/pkg --portagePkgJarDir ${EPREFIX}/usr/share/chisel/libs --scalacOpts ${SCALACOPTS} --outputJar ${PKGBUILDDIR}/${P}.jar || die "chiselc failed"
}

# @FUNCTION: chisel_src_test
# @DESCRIPTION:
# Runs any tests written with the Chisel testing frameworks.
chisel_src_test() {
	# TODO: invoke Chisel tests in whatever standardized way we come up with.
	:
}

# @FUNCTION: chisel_src_install
# @DESCRIPTION:
# Installs the package, copying the jarfile to the global repository and
# generating any necessary package descriptors.
chisel_src_install() {
	mkdir -p ${DSTLIBDIR}
	cp ${PKGBUILDDIR}/${P}.jar ${DSTLIBDIR}/${P}.jar
}
