{ system, inputs, config, options, lib, pkgs, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "nixosuser";
    home.homeDirectory = "/home/nixosuser";
    # release notes.
    home.stateVersion = "25.05"; 

    home.packages = with pkgs; [
		zsh-powerlevel10k
    ];

	# SESSION VARIABLES =--------------------------------------
    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
    };

	xdg.mimeApps = {
		enable = true;
		associations.added = {
			"x-scheme-handler/tg" = "org.telegram.desktop.desktop;";
			"x-scheme-handler/tonsite" = "org.telegram.desktop.desktop;";
		};
		defaultApplications = {
			# ZEN BROWSER =---=
			"text/html" = "app.zen_browser.zen.desktop";
			"x-scheme-handler/http" = "app.zen_browser.zen.desktop";
			"x-scheme-handler/https" = "app.zen_browser.zen.desktop";
			"x-scheme-handler/about" = "app.zen_browser.zen.desktop";
			"x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
			"x-scheme-handler/chrome" = "app.zen_browser.zen.desktop";
			"application/x-extension-htm" = "app.zen_browser.zen.desktop";
			"application/x-extension-html" = "app.zen_browser.zen.desktop";
			"application/x-extension-shtml" = "app.zen_browser.zen.desktop";
			"application/x-extension-xhtml" = "app.zen_browser.zen.desktop";
			"application/x-extension-xht" = "app.zen_browser.zen.desktop";
			"application/xhtml+xml" = "app.zen_browser.zen.desktop";

			# PCMANFM =---=
			# "inode/directory" = "thunar.desktop";
			"inode/directory" = "org.gnome.Nautilus.desktop";
			
			# NXSIV =---=
			"image/png"="nsxiv.desktop";
			"image/jpeg"="nsxiv.desktop";
			"image/webp"="nsxiv.desktop";
			"image/bmp"="nsxiv.desktop";
			"image/svg+xml"="nsxiv.desktop";

			# PDF ZARTHURA =---=
			"application/pdf"="org.pwmt.zathura.desktop";
		};
	};

	# ZSH =-------------------------------------------------=
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
				"sudo"
				"extract"
				"colored-man-pages"
				"web-search"
			];
		};

		initContent = ''
			source ~/.p10k.zsh
			zstyle ':completion:*' matcher-list 'r:|=l'
			export PATH="$HOME/.cargo/bin:$PATH"
		''; 
	
		plugins = [
			{name = "powerlevel10k";src = pkgs.zsh-powerlevel10k;file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}
		];

		shellAliases = {
			update = "sudo nixos-rebuild switch --flake ~/nixos";
			update-flake = "nix flake update --flake ~/nixos";
		};
	};

	# GIT =-------------------------------------------------=
    programs.git = {
        enable = true;
        userName = "UsarnameForGit";
        userEmail = "email@example.com";
        extraConfig = {
            init.defaultBranch = "main";
        };
    };

    programs.ssh = {
        enable = true;
        matchBlocks = {
            "github.com" = {
                hostname = "github.com";
                user = "git";
                identityFile = "~/.ssh/yourSSH";
            };
        };
    };

    # THEMES =------------------------------------------------=
    gtk = {
        enable = true;
        theme = {
            package = pkgs.gruvbox-gtk-theme;
            name = "Gruvbox-Dark";
        };
        iconTheme = {
            package = pkgs.gruvbox-material-gtk-theme;
            name = "Gruvbox-Material-Dark"; 
        };
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "adwaita-dark";
        style.package = pkgs.adwaita-qt;
    };

    home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 12;
        hyprcursor = {
            enable = true;
            size = 12;
        };
        x11.enable = true;
        gtk.enable = true;
    };

    xresources.properties = {
      "Nsxiv.window.background" = "#121110";
      "Nsxiv.window.foreground" = "#f2e5bc";
      "Nsxiv.bar.background" = "#222222";
      "Nsxiv.bar.foreground" = "#f2e5bc";
      "Nsxiv.mark.foreground" = "#c9a554";
    };

	# HOME MANAGER =------------------------------------------
    
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
