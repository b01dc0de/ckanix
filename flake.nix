{
  description = "ckanix -- CKA NixOS config via flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      primus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  hosts/primus
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cka = import ./home.nix;
          }
        ];
      };
    };
  };
}
