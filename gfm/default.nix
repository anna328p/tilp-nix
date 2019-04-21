{ stdenv, fetchurl, intltool, gettext, makeWrapper, autoconf, automake, libtool
, glib, pkgconfig, gtk2, libxml2, hicolor-icon-theme, gnome2
, libusb, libticonv, libticalcs, libtifiles, libticables
, libarchive, zlib, fetchFromGitHub
}:

stdenv.mkDerivation rec {
	pname = "gfm";
	version = "1.17";

	src = fetchFromGitHub {
		owner = "debrouxl";
		repo = "tilp_and_gfm";
		rev = "ebcaea2388ebbc5ad1985944df7a8a05ce84b38a";

		sha256 = "0iagl2wiaj1wnyybwnq429c2ccadqrywyxfv4krvxnwr88s67s82";
	};

	patches = [
		./pkgconfig-include-ticables.patch
	];

	#configureFlags = [ "--disable-doc" ];

	nativeBuildInputs = [
		intltool gettext makeWrapper pkgconfig
		autoconf automake libtool
	];
	buildInputs = [
		glib gtk2 libxml2 hicolor-icon-theme gnome2.libglade
		zlib libarchive
		libticonv libticalcs libtifiles libticables
	];

	preConfigure = ''
		cd gfm/trunk
		autoreconf -si
	'';
	preInstall = ''
	'';

	postInstall = ''
	'';

	meta = with stdenv.lib; {
		description = "Group file manager program for Texas Instruments calculators";
		homepage = http://lpg.ticalc.org/prj_tilp/;
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
	};
}

# vim: ts=4 sw=4 noet ai
