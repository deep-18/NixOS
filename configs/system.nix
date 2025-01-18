  GNU nano 8.2                      configs/system.nix                       Modified  
{config, pkgs, ...};

{
 environment.systemPackages = with pkgs; [
   git
   docker
   python3
 ];
 services.docker.enable = true;
 services.openssh.enable = true;
 networking.hostname = "nixos-flake";
 time.timeZone = "UTC";
 i18n.defaultLocale = "en_US.UTF-8";
}
