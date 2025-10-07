# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
    ################
    # CHAGE LABEL! #
    ################
    # =======================
    system.nixos.label = "YOUR_NIXOS_GENERATION_LABEL";
    # =======================

    imports =
        [
            ./nixos/hardware-configuration.nix 
            ./pkgs/pkgs.nix
            ./pkgs/hardware.nix 
            ./pkgs/languages.nix
        ];
    
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # == ESENTIAL CONFIGURATION ====================================

    # BOOT =-----------------------------=

    boot.loader.systemd-boot.enable = true;
    boot.loader.timeout = 1;
    boot.loader.efi.canTouchEfiVariables = true;
    
    services.displayManager.ly.enable = true;

    # NETWORK =--------------------------=

    networking.networkmanager.enable = true;

    time.timeZone = "America/Mexico_City";

	networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 80 443 8008 8009 443 7770 8443 ];
		allowedUDPPorts = [ 1900 5353 80 51820 4569 1194 5060 ];
		allowedUDPPortRanges = [
			{ from = 1; to = 65535; }
		];
		checkReversePath = false;
	};
	systemd.services.NetworkManager-wait-online.enable = false;

    # DESKTOP =---------------------------=

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    
    # Interactions
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

	# Force Wayland
	environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # USERS =----------------------------=

    users.users.nixosuser = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "dialout" "uucp" "plugdev" "docker" ];
        shell = pkgs.zsh;
        home = "/home/nixosuser";
    };  

    # SUDO =------------------------------=

    security.sudo.enable = true;
    
    # == APPS CONFIGURATION ========================================

	# Docker
	virtualisation.docker = {
		enable = true;
		enableOnBoot = false;
	};
     	
    # File manager PCMANFM autoMounting
    services.gvfs.enable = true;

    # TouchScreen
    services.libinput.enable = true;
    
    # Cup (Prints screens)
    services.printing.enable = true;
    
    # Steam configuration
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
        gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;

    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/nixosuser/.steam/root/compatibilitytools.d";
    };

    # Fonts 
    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.roboto-mono
		monocraft
    ];


    # USB Arduino
    services.udev.extraRules = ''
        # Permisos para dispositivos seriales (Arduino, ESP, etc.)
        KERNEL=="ttyUSB[0-9]*", MODE="0666"
        KERNEL=="ttyACM[0-9]*", MODE="0666"
    '';

    # Flatpak
    services.flatpak.enable = true;
    systemd.services.flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.flatpak ];
        script = ''
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
    };

	# Enable ZSH
	programs.zsh.enable = true;

	# Gnome Keyring
	services.gnome.gnome-keyring.enable = true;

    # PROGRAMS =--------------------------=
    environment.systemPackages = with pkgs; [
		# they are on pkgs.nix
    ];

    system.stateVersion = "25.05"; # Did you read the comment?
}
