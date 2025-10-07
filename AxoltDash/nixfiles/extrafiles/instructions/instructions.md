# Insrtructions to install NixOS extras (Recommended)
Are so many extras than I do'nt moved to the .nix configuration, so you need to install it manually. This is the instructions to install it.

### Add Proton-GE to Steam
If you want to enable STEAM GE-PROTON, you can do so by following the steps below:
```shell
protonup
```

### Install Rain World Font
If you want the Rain World font (On the user), you can install it with:
```shell
mkdir -p ~/.local/share/fonts
cp -r /etc/nixos/extrafiles/RainWorldSymbols.ttf ~/.local/share/fonts
fc-cache -f -v
```
Check if the font is installed with:
```shell
fc-list | grep "RainWorldSymbols
```

### Install trim-generattions.sh
This scripts helps you to delete the old generations of your system. Its configurable, but you need to change te name of the path script (this is on `configuration.nix`). Before you need to give its permissions:
```shell
sudo chmod +x /home/axolt/nixos/scripts/trim-generations.sh
```
Now, this script is ready to use. It automatically delete the old generations of your system and it's running thanks to `configuration.nix`.

### Install my own server ssh waiter
If you want to use my own server ssh waiter, you need to chmod the next script:
```shell
sudo chmod +x /home/axolt/nixos/scripts/server.sh
```

### Hardware-configuration.nix
All machine have a different hardware configuration, so you need to copy the `hardware-configuration.nix` file from your computer. This file is located in `/etc/nixos/hardware-configuration.nix`. When you copy this file, need to paste it in the path of this git repo, In mi case is:
```shell
sudo chown -R axolt:users /home/axolt/nixos/hardware-configuration.nix
```
Do not forget to change the owner of the file, because this file is owned by root and you need to change it to your user (axolt in this case).


### Installed FLATPAKS
All packages arent installed by default (Because don't work with the Nixos Pkgs), you need to install them with flatpack:
#### Zen browser
```shell
flatpak install flathub app.zen_browser.zen
```
#### Minecraft Bedrock Launcher
```shell
sudo flatpak install flathub io.mrarm.mcpelauncher
```

### My Dotfiles
So many things from this NixOS configuration interact directly with some of my dotfiles. If do you need them, clone my dotfiles repository:
```shell
git clone https://github.com/AxoltDash/dotfiles.git
```
> Since I haven't created the repository yet, I'll put some configuration in this file, I'll delete it when I create the other repository.
##### Install Scripts (THIS WILL BE MOVED TO ANOTHER REPO)
You need my .config installation (I need put their in this repo or on another repo):
```shell
sudo chmod +x ~/.config/hypr/scripts/battery_notify.sh 
sudo chmod +x ~/.config/waybar/scripts/waybar-blue-light-filter.sh
```

