{
  description = "Flake for TypeScript development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = pkgs.mkShell {
            packages = [ 
              pkgs.typescript
              pkgs.nodejs_18
              pkgs.nodePackages.typescript-language-server
              pkgs.nodePackages.wrangler
            ];
          };
        }
      );
}

