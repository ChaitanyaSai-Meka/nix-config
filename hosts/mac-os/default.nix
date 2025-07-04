{ config, pkgs, lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System-level CLI tools or GUI apps
  environment.systemPackages = with pkgs; [
    vlc
    openjdk
    metasploit
    android-platform-tools
  ];

  # --- System Services ---
  # services.sshd.enable = true; # Example: Enable SSH daemon
  # services.postgresql.enable = true; 

  # --- Desktop Environment Customization (macOS Specific) ---
  # Set desktop wallpaper (assuming image is in hosts/mac-os/assets/)

}
