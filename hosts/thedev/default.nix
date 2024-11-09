{ config, pkgs, lib, ... }:
{
	imports =
	[
		./hardware-configuration.nix
		../../configuration.nix
	];

# Hostname:
	networking.hostName = "thedev";

# GPU Settings:
	hardware.graphics.enable = lib.mkForce true;
	hardware.graphics.enable32Bit = lib.mkForce true;
	services.xserver.videoDrivers = lib.mkForce ["nvidia"];
	hardware.nvidia = lib.mkForce {
		open = true;
		#modesetting.enable = true;
		prime = {
			#sync.enable = true;
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};

	boot.loader.efi.canTouchEfiVariables = lib.mkForce true;
	boot.loader.systemd-boot.enable = lib.mkForce false;
	boot.loader.grub = lib.mkForce {
		device = "nodev";
		default = "saved";
		configurationLimit = 24;
		efiSupport = true;
		useOSProber = true;
	};
}
