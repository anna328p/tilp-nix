{ lib, newScope, fetchFromGitHub }:

lib.makeScope newScope (self: with self; {
	version = "unstable-2019-10-29";

	src = fetchFromGitHub {
		owner = "debrouxl";
		repo = "tilibs";
		rev = "7be38a45c052ce886d41d10e55d357d9183d4f69";

		sha256 = "1m7wcsjis7lx3fhq440n36wad144d83swcy5gpgksnccjnf8hdc9";
	};

	globalMeta = with lib; {
		homepage = http://lpg.ticalc.org/prj_tilp/;
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
		maintainer = maintainers.dkudriavtsev;
	};

	libticables = callPackage ({ stdenv, pkgconfig, autoreconfHook, libusb1, glib }:
		stdenv.mkDerivation rec {
			pname = "libticables";
			inherit version src;
			sourceRoot = "source/${pname}/trunk";

			configureFlags = [ "--enable-libusb10" ];

			nativeBuildInputs = [ autoreconfHook pkgconfig ];
			buildInputs = [ libusb1 glib ];

			meta = globalMeta // {
				description = "Cables library for Texas Instruments calculators";
			};
		}
	) {};

	libticonv = callPackage ({ stdenv, pkgconfig, autoreconfHook, glib }:
		stdenv.mkDerivation rec {
			pname = "libticonv";
			inherit version src;
			sourceRoot = "source/${pname}/trunk";

			nativeBuildInputs = [ autoreconfHook pkgconfig ];
			buildInputs = [ glib ];

			meta = globalMeta // {
				description = "Conv library for Texas Instruments calculators";
			};
		}
	) {};

	libtifiles = callPackage ({ stdenv, pkgconfig, autoreconfHook, glib, libticonv, libarchive }:
		stdenv.mkDerivation rec {
			pname = "libtifiles";
			inherit version src;
			sourceRoot = "source/${pname}/trunk";

			nativeBuildInputs = [ autoreconfHook pkgconfig ];
			buildInputs = [ glib libticonv libarchive ];

			meta = globalMeta // {
				description = "Files library for Texas Instruments calculators";
			};
		}
	) {};

	libticalcs = callPackage ({ stdenv, pkgconfig, autoreconfHook, glib, libticables, libtifiles }:
		stdenv.mkDerivation rec {
			pname = "libticalcs";
			inherit version src;
			sourceRoot = "source/${pname}/trunk";

			nativeBuildInputs = [ autoreconfHook pkgconfig ];
			buildInputs = [ glib libticables libtifiles libticonv ];

			meta = globalMeta // {
				description = "Calculators library for Texas Instruments calculators";
			};
		}
	) {};
})
