{
  description = "Declarative and reproducible macOS system and user configuration powered by Nix. Leveraging Nix-Darwin for robust system-wide settings and Home Manager for seamless management of user environments, applications, and dotfiles across devices.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    mkHost = { name, modulesPath, homePath ? null, system }:
      nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          (import modulesPath)

          (if homePath != null then home-manager.darwinModules.home-manager else {})
          (if homePath != null then {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.mekachaitanyasai = { # Your macOS username
              imports = [ (import homePath) ];
            };
          } else {})
        ];
        specialArgs = {
          inherit inputs;
        };
        system.configurationRevision = self.rev or self.dirtyRev or null;
      };

  in
  {
    darwinConfigurations."mac-os" = mkHost {
      name = "mac-os";
      modulesPath = ./hosts/mac-os;
      homePath = ./hosts/mac-os/home.nix;
      system = "aarch64-darwin"; # IMPORTANT: Change to "x86_64-darwin" if you have an Intel Mac
    };

    # For future Windows setup:
    # systems.windows-os = { /* Future Windows Nix config here */ };
  };
}