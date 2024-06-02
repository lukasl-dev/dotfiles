{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    plugins = with pkgs; [
      pkgs.tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides "*:Ss=\E[%p1%d q:Se=\E[ q
      set-environment -g COLORTERM "truecolor"

      set -g @plugin "catppuccin/tmux"
      set -g @catppuccin_flavour "mocha"
    '';
  };
}
