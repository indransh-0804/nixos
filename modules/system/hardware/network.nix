{self, inputs, ...}:{
  flake.nixosModules.network = { config, pkgs, lib, ... }: {
  networking = {
    networkmanager.enable = true;
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
    DNSSEC = "allow-downgrade";
    FallbackDns = [ "1.1.1.1" "9.9.9.9" ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanager
iw
    dig
    tcpdump
    ethtool
  ];
};
                    }
