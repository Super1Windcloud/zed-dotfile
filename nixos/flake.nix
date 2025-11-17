{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          ./configuration.nix
          ({ pkgs, ... }: {
            programs.yazi.enable = true;
            programs.starship.enable = false;
            programs.zsh = {
              enable = true;
              histSize = 100000;
              enableCompletion = true;
              autosuggestions.enable = true;
              shellInit = "bindkey '^H' backward-kill-word";
              ohMyZsh = {
                enable = true;
                plugins = [ "git" "z" "docker" ];
                theme = "robbyrussell";

              };
            };
            #Docker
            virtualisation.docker = {
              enable = true;
              enableOnBoot = true; # WSL 需手动启动：`sudo systemctl start docker`
            };

            i18n.defaultLocale = "zh_CN.UTF-8";
            fonts = {
              enableDefaultPackages = true; # 替换 enableDefaultFonts
              packages = with pkgs; [
                # 替换 fonts
                noto-fonts-cjk-sans
                wqy_zenhei
              ];
              fontconfig = {
                defaultFonts = {
                  sansSerif = [ "Noto Sans CJK SC" ];
                };
              };
            };


            users.users.super = {
              extraGroups = [ "docker" ];
            };
            # start dconf services
            services.dbus.packages = [ pkgs.dconf ];
            programs.dconf.enable = true;

            environment.systemPackages = with pkgs;[
              aria2
              bat
              dust
              p7zip
              gdu
              superfile
              nautilus
              fastfetch
              docker-compose
              rustc
              cargo
              nodejs
              python3
            ];
          })
        ];
      };
    };
  };
}
