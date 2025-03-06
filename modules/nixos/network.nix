{ hostName, ... }:
{
  networking = {
    hostName = hostName;

    networkmanager.enable = true;

    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    firewall.enable = false;
  };
}
