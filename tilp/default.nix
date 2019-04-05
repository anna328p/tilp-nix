{ stdenv, fetchurl, intltool, gettext, makeWrapper, autoconf, automake, libtool
, glib, pkgconfig, gtk2, libxml2, hicolor-icon-theme
, libarchive, zlib, libusb, fetchFromGitHub
}:

stdenv.mkDerivation rec {
	name = "tilp-1.17";

	src = fetchFromGitHub {
		owner = "debrouxl";
		repo = "tilp_and_gfm";
		rev = "ebcaea2388ebbc5ad1985944df7a8a05ce84b38a";

		sha256 = "0iagl2wiaj1wnyybwnq429c2ccadqrywyxfv4krvxnwr88s67s82";
	};

	#configureFlags = [ "--disable-doc" ];

	buildInputs = [ glib gtk2 libxml2 hicolor-icon-theme zlib libarchive autoconf automake libtool ];
	nativeBuildInputs = [ intltool gettext makeWrapper pkgconfig ];

	preConfigure = ''
		cd tilp/trunk
		autoreconf -si
	'';
	preInstall = ''
	'';

	postInstall = ''
	'';

	meta = with stdenv.lib; {
		description = "Linking program for Texas Instruments calculators";
		homepage = http://lpg.ticalc.org/prj_tilp/;
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
	};
}

# vim: ts=4 sw=4 noet ai
