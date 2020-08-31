self: super: let
    tilibs = super.callPackage ./libs.nix { };
	args = {
		inherit (tilibs) libticalcs libticonv libtifiles libticables;
	}
; in {
    tilp = super.callPackage ./tilp/default.nix args;
    gfm = super.callPackage ./gfm/default.nix (args // {
		inherit (super.gnome2) libglade;
    });
}
