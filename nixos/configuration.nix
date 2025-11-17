{ config, lib, pkgs, ... }:

{

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs; # only for NixOS 24.05
  };
  wsl.enable = true;
  wsl.defaultUser = "super";
  nixpkgs.config.allowUnfree = true; # 允许不安全的包
  users.users.super =
    {
      shell = pkgs.zsh;
    };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [

    git
    vim
    wget
    gzip
    gedit
    nixpkgs-fmt
  ];

  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
