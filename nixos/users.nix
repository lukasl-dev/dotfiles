{ config, pkgs, ... }:

{
  users.users = {
    lukas = {
      isNormalUser = true;
      description = "Lukas Leeb";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };

    ollama = {
      isSystemUser = true;
      description = "Ollama User";
      group = "ollama";
      home = "/usr/share/ollama";
      createHome = true;
    };
  };

  users.groups = {
    ollama = {};
  };
}
