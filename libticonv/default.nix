{ stdenv, fetchurl, intltool, gettext, makeWrapper, autoconf, automake, autoreconfHook, libtool
, glib, pkgconfig, libxml2, hicolor-icon-theme
, libarchive, zlib, libusb, fetchFromGitHub
}:

stdenv.mkDerivation rec {
	libname = "conv";
	pname = "libti${libname}";
	version = "unstable-2019-01-04";

	src = fetchFromGitHub {
		owner = "debrouxl";
		repo = "tilibs";
		rev = "0af94be9eafba8d278bc5a044c818117ca1221b2";

		sha256 = "1yb56alnp396r5cijh9dz5112362m120sjmx4hndrkkirv1z2g24";
	};

	configureFlags = [ "--enable-libusb10" ];

	nativeBuildInputs = [ intltool gettext makeWrapper pkgconfig automake autoconf libtool ];
	buildInputs = [ glib hicolor-icon-theme zlib libarchive libusb ];

	preConfigure = ''
		cd ${pname}/trunk
		autoreconf -si
	'';

	meta = with stdenv.lib; {
		description = "${libname} library for TI calculators";
		homepage = http://lpg.ticalc.org/prj_tilp/;
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
	};
}

# vim: ts=4 sw=4 noet ai
