{ stdenv, fetchurl, intltool, gettext, makeWrapper, autoconf, automake, libtool
, glib, pkgconfig, libxml2, hicolor-icon-theme
, libarchive, zlib, libusb, fetchFromGitHub
}:

stdenv.mkDerivation rec {
	name = "libticonv";

	src = fetchFromGitHub {
		owner = "debrouxl";
		repo = "tilibs";
		rev = "0af94be9eafba8d278bc5a044c818117ca1221b2";

		sha256 = "1yb56alnp396r5cijh9dz5112362m120sjmx4hndrkkirv1z2g24";
	};

	#configureFlags = [ "--disable-doc" ];

	buildInputs = [ glib hicolor-icon-theme zlib libarchive autoconf automake libtool ];
	nativeBuildInputs = [ intltool gettext makeWrapper pkgconfig ];

	preConfigure = ''
		cd libticonv/trunk
		autoreconf -si
	'';
	preInstall = ''
	'';

	postInstall = ''
	'';

	meta = with stdenv.lib; {
		description = "ticonv library for TI calculators";
		homepage = http://lpg.ticalc.org/prj_tilp/;
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
	};
}

# vim: ts=4 sw=4 noet ai
