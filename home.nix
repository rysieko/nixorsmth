{ config, pkgs, osConfig,inputs, ... }:

{
  imports = [
    ./config/hyprland.nix
    ./config/kitty.nix
    ./config/hyprpanel.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rysieko";
  home.homeDirectory = "/home/rysieko";
  home-manager.useGlobalPkgs = true;
  wayland.windowManager.hyprland.enable = true;
  programs.hyprpanel.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "Nordic"; # The name of the theme to be used
      package = pkgs.nordic; # The package containing the theme
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    gtk3 = {
      extraConfig = "gtk-application-prefer-dark-theme=1";
      
    };
    gtk4 = {
      extraConfig = " gtk-application-prefer-dark-theme=1";
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = ;
    borderWidth = 0;
    scrollbar = true;
    terminal = pkgs.kitty;
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  home.file = {
    
  };

  home.sessionVariables = {
     EDITOR = "nano";
     XCURSOR_SIZE = 24;
     HYPRCURSOR_SIZE = 24;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
#nice