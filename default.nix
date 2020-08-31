self: super: rec {
    libs = super.callPackage ./libs.nix { };

    tilp = super.callPackage ./tilp/default.nix { inherit libs; };
    gfm = super.callPackage ./gfm/default.nix { inherit libs; };
}
