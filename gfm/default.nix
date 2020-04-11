{ stdenv, fetchFromGitHub, autoreconfHook, pkgconfig
, glib, gtk2
, libticonv, libticalcs, libtifiles, libticables
}:

stdenv.mkDerivation rec {
	pname = "gfm";
	version = "1.18-unstable-2019-10-12";

	src = fetchFromGitHub {
		owner = "debrouxl";
		repo = "tilp_and_gfm";
		rev = "3e17743910aab7bf4493e7859d3b89d698096da2";

		sha256 = "1dckjh1fn6wqxb48bq2b94fpnn7p4x5jw1dhllsnqycp1aic3hlc";
	};

	nativeBuildInputs = [ pkgconfig autoreconfHook ];
	buildInputs = [
		glib gtk2
		libticonv libticalcs libtifiles libticables
	];

	sourceRoot = "source/${pname}/trunk";

	meta = with stdenv.lib; {
		description = "Group file manager for Texas Instruments calculators";
		homepage = http://lpg.ticalc.org/prj_tilp/;
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
	};
}
