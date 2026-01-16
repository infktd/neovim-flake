{
  description = "my personal working config for neovim using nvf.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-darwin"];
    
    forAllSystems = nixpkgs.lib.genAttrs systems;
    
    mkNeovim = system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
      nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [./config];
      };
  in {
    # Standalone package
    packages = forAllSystems (system: {
      default = (mkNeovim system).neovim;
    });

    # NixOS module
    nixosModules.default = {
      imports = [nvf.nixosModules.default];
      programs.nvf = {
        enable = nixpkgs.lib.mkDefault true;
        settings = import ./config;
      };
    };

    # Home-Manager module
    homeManagerModules.default = {
      imports = [nvf.homeManagerModules.default];
      programs.nvf = {
        enable = nixpkgs.lib.mkDefault true;
        settings = import ./config;
      };
    };

    # Overlay
    overlays.default = final: prev: {
      neovim-flake = (mkNeovim final.system).neovim;
    };
  };
}
