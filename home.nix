{ config, pkgs, ... }:

{
# home-manager settings:
  home.homeDirectory = "/home/cka";
  home.username = "cka";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

# Xresources:
  xresources.properties = {
      "Xcursor.size" = 16;
      "Xft.dpi" = 172;
  };

# Pkgs:
  home.packages = with pkgs; [
    fastfetch
  ];

# Programs config:
  programs.alacritty = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "CKA | b01dc0de";
    userEmail = "cka.txt@gmail.com";
  };
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      background_opacity = "0.5";
      background_blur = 5;
    };
    themeFile = "Catppuccin-Macchiato";
  };
}
