{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
  ];

# Hostname:
  networking.hostName = "thenous";
}
