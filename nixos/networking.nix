{ config, pkgs, ... }:

{
  networking.hostName = "leeb";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;
}
