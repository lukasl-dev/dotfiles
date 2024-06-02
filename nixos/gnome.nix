{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    displayManager = {
      gdm.enable = true;
    };

    desktopManager = {
      gnome.enable = true;
    };

    layout = "de";
    xkbVariant = "";
  };

  xdg.autostart.enable = true;
}
