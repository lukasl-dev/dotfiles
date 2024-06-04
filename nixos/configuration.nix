{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nix.nix
      ./i18n.nix
      ./xdg.nix
      ./bootloader.nix
      ./networking.nix
      ./services.nix
      ./users.nix
      ./opengl.nix
      ./nvidia.nix
      ./environment.nix
      ./gnome.nix
      ./sound.nix
      ./docker.nix
      ./fonts.nix
      ./nix-ld.nix

      ./tmux.nix
      ./fish.nix
      ./neovim.nix
      ./1password.nix
      ./steam.nix
    ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    zig
    zulu
    obsidian
    wezterm
    nodejs
    bun
    go
    python3
    wl-clipboard
    alacritty
    ripgrep
    brave
    gh
    texliveFull
    httpie
    ollama
    zoxide
    vesktop
    youtube-dl
    graphviz
    teams-for-linux
    slack
    signal-desktop
    whatsapp-for-linux
    zoom-us
    speedtest-cli
    btop
    fastfetch

    # gtk themes
    catppuccin-gtk
    gnome.adwaita-icon-theme

    # gnome extensions
    gnomeExtensions.runcat
    gnomeExtensions.appindicator
    gnomeExtensions.pano
    gnome.gnome-tweaks

    # fish plugins
    fishPlugins.bobthefish

    # tmux plugins
    tmuxPlugins.catppuccin

    minecraft
    lutris
    wineWowPackages.waylandFull
  ];

  programs.hyprland.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

