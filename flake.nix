{
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.x86_64-linux = import ./default.nix { inherit pkgs; };
      overlay = final: prev: {
        dotnet2nix = self.packages.x86_64-linux.dotnet2nix;
      };
    };
}
