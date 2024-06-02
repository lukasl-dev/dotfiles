{ config, pkgs, ... }:

{
  # systemd.services.ollama = {
  #   enable = false;
  #   description = "Ollama";
  #   unitConfig = {
  #     After = "network-online.target";
  #   };
  #   serviceConfig = {
  #     ExecStart = "${pkgs.ollama}/bin/ollama serve";
  #     User = "ollama";
  #     Group = "ollama";
  #     Restart = "always";
  #     RestartSec = 3;
  #   };
  #   wantedBy = [ "default.target" ];
  # };

  # TODO: fix permission issue when trying to start `ollama serve` via systemd
}
