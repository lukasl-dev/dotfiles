{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    wlr = {
      enable = true;
    };
	};

  security = {
    polkit.enable = true;
    pam.services.ags = {};
  };

#   wayland.windowManager.hyprland = {
#     enable = true;
#     package = pkgs.hyprland;
#     systemd.enable = true;
#     xwayland.enable = true;
# #     plugins = [
# # # inputs.hyprland-hyprspace.packages.${pkgs.system}.default
# # # plugins.hyprexpo
# # # plugins.hyprbars
# # # plugins.borderspp
# #     ];
#   };

  services.xserver.displayManager.startx.enable = true;
}
