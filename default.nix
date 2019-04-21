self: super: {
    libticables = super.callPackage ./libticables/default.nix { };
    libticalcs = super.callPackage ./libticalcs/default.nix { };
    libticonv = super.callPackage ./libticonv/default.nix { };
    libtifiles = super.callPackage ./libtifiles/default.nix { };
    tilp = super.callPackage ./tilp/default.nix { };
    gfm = super.callPackage ./gfm/default.nix { };
}
