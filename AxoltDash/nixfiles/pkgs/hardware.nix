{ inputs, config, lib, pkgs, ... }:

{
    # driver AMDGPU (integrate graphics)
    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [ amdvlk ];
            extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
        };
        amdgpu.amdvlk = {
            enable = true;
            support32Bit.enable = true;
        };
    };

    # Mesa and Vulkan 
	environment.systemPackages = with pkgs; [
        mesa  # Drivers OpenGL/Vulkan
        mesa.opencl
        mesa-demos  # Herramientas para probar OpenGL
        vulkan-tools  # Herramientas Vulkan
        vulkan-validation-layers
    ];
    
    # Cpu
    # hardware.cpu.amd.updateMicrocode = true;

    # Batery management
    powerManagement.enable = true;
    services.tlp.enable = true;

    services.xserver.videoDrivers = [ "amdgpu" ];

    # BLUETOOTH =-------------------------=

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings.General = {
            experimental = true; # show battery
            Privacy = "device";
            JustWorksRepairing = "always";
            Class = "0x000100";
            FastConnectable = true;
        };
    };
    services.blueman.enable = true; 
    hardware.xpadneo.enable = true; # Enable the xpadneo driver for Xbox One wireless controllers

    # SOUND =-----------------------------=

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
		wireplumber.enable = true;
		wireplumber.extraConfig.bluetoothEnhancements = {
			"monitor.bluez.properties" = {
				"bluez5.enable-sbc-xq" = true;
				"bluez5.enable-msbc" = true;
				"bluez5.enable-hw-volume" = true;
				"bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
			};
		};
    };

    # Botting
    boot = {
        extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
        extraModprobeConfig = ''
            options bluetooth disable_ertm=Y
        '';
        # connect xbox controller
    };
    

    #NAME OF THE SYSTEM
    networking.hostName = "hostname"; # hostname.
}
