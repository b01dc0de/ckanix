{ config, pkgs, ... }:

{
# Enable flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Allow unfree pkgs:
  nixpkgs.config.allowUnfree = true;

# Bootloader:
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.default = "saved";
  boot.loader.grub.useOSProber = true;

# Networking:
  networking.networkmanager.enable = true;

# Timezone:
  time.timeZone = "America/Chicago";

# Locale:
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

# DE / WM:
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

# Keymap:
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

# Printing:
  services.printing.enable = true;

# Sound:
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

# Bluetooth:
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

# Security:
  security.polkit.enable = true;

# libexec:
  environment.pathsToLink = [ "/libexec" ];

# Define users:
  users.users.cka = {
    isNormalUser = true;
    description = "CKA";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

# Fonts:
  fonts.enableDefaultPackages = true;
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    oxygenfonts
  ];

# Enable GPU support:
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

# Env settings:
  environment.variables.EDITOR = "vim";

# Program config:
  programs.firefox.enable = true;
  programs.chromium.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

# Define pkgs:
  environment.systemPackages = with pkgs; [
    catppuccin
    dracula-theme
    dracula-icon-theme
    kitty
    git
    github-desktop
    neovide
    obsidian
    spotify
    tmux
    vim-full
    vscode
  ];

  system.stateVersion = "24.11"; # NOTE: Doublecheck before changing this value
}
