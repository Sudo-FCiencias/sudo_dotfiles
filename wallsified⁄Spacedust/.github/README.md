<h2 align='center'>
  The stars don't look bigger, but they do look brighter...
</h2>

<br>

# Hello there...
Cuando recién empecé a moverme en el mundo Linux y averigué sobre el ricing, terminé haciendo en su momento un fork de los dotiles de 
[N3k0Ch4n](https://github.com/N3k0Ch4n/), los cuales eran (en este momento no lo se) basandose en AwesomeWM. 

Principalmente lo que hice fue cambiar la paleta de colores y ajustar un par de aplicaciones para integrarlo, pero no llegue a meterme
a la parte de crear widgets o algo por el estilo. La paleta de colores se llama **Spacedust**, de ahi el nombre del _rice_.
Actualmente no ocupo estos dotfiles, y seguramente lo que se requeria en el momento ha cambiado, pero por el afán de preservar
y compartir, aquí están los archivos de ese entonces. 

Eso si, el wallpaper en HD [está aqui](https://old.reddit.com/r/vandwellers/comments/elcbri/living_out_of_a_uaz452_buhanka_in_georgia_the/)

---

## La Base:

O al menos, lo que deje en el repo antiguo que era la base.

- **OS** - Manjaro
- **WM**   - AwesomeWM
- **Terminal**  - Alacritty
- **Compositor**  - Picom
- **Menu/Launcher/Cambiador de Pantallas** - Rofi
- **Shell** - Zsh+Powerlevel10k+Colorls
- **Navegador** - Vivaldi 

---


## ¿Como lo instalo?
Bueno, aquí es donde se pone complicado. Pero en su momento esto era 
parte de lo necesario:

**1.(Posibles) Dependencias**
  - Awesome-git
  - inotify-tools
  - Playerctl
  - Brightnessctl
  - Pulseaudio
  - Network-Manager
  - JetBrains Nerd Font
  - Font Awesome 
  - Neofetch
  - Zsh
  - Alacritty
  - Betterlockscreen
  - Flameshot
  - Vivaldi
  - Pavucontrol
  - Spicetify

</details>

```sh
sudo pacman -Syu alacritty cava inotify-tools playerctl brightnessctl pulseaudio networkmanager alsa-utils alsa-plugins alsa-firmware xclip base-devel pamixer flameshot vivaldi pipes.sh nm-connection-editor pulseaudio-equalizer-gtk pavucontrol
```

```sh
yay awesome-git nerd-fonts-jetbrains-mono ttf-jetbrains-mono 
```

Puede que con lo de arriba en Manjaro/Arch y derivados instale algunas cosas, y las otras es mejor referirse a la documentación
oficial, como con Spicetify.

**2. Clona el repo** 

[!INFO]
> Aquí me acuerdo que habia que inicializar "awesome-wm-widgets" y otro repo
> Asi que sería necesario hacer `git submodule init` y `git submodule update`
> dentro del repo una vez lo bajes.

**3. Copia lo necesario en "$HOME/.config/"**

Usa esto de guía, no como un hecho.
```sh
cp -rf awesome picom neofetch alacritty rofi colorls $HOME/.config/
cp -rf .zshrc $HOME/
```

**4. Instala la extensión de VS Code:**

```sh
# O con VS Codium, usa code vscodium
code --install-extension spacedust-0.0.1.vsix
```

Y puede que necesitar ajustar algunas cosas usando `settings.json`  


**5. Instala Spicefity y usa el tema 'Dribbblish'. Luego añades lo de la carpeta.**

[!INFO]
> En su momento ocupaba Spotify por lo práctico, pero con todo lo que se ha metido
> no lo vale más. Dejo los archivos igual como histórico. 


**6. Reincia el sistema y selecciona AwesomeWM.**

## ¡Así era como se veía antes!

<img widht="300px" src="https://github.com/Wallsified/Spacedust/blob/main/.github/Spacedustv3.2_a.png">
<img widht="300px" src="https://github.com/Wallsified/Spacedust/blob/main/.github/Spacedustv3.2_b.png">
<img widht="300px" src="https://github.com/Wallsified/Spacedust/blob/main/.github/Spacedustv3.2_c.png">
<img widht="300px" src="https://github.com/Wallsified/Spacedust/blob/main/.github/Spacedustv3.2_d.png">
<img widht="300px" src="https://github.com/Wallsified/Spacedust/blob/main/.github/Spacedustv3.2_e.png">
<img widht="300px" src="https://github.com/Wallsified/Spacedust/blob/main/.github/Spacedustv3.2_f.png">

---

### Algunos Atajos.

| Keybinds    | Launches |
| ----------- | -------- |
| Mod + x     | Terminal |
| Mod + z     | Vivalidi |
| Mod + Space | Change Layout  |
| Mod + r     | Rofi Launcher  |
| Mod + q     | Close Window   |
| Mod + s     | Powermenu|
| Mod + Ctrl + n | Un-minimize |
| Mod + F1    | Global Binds Popup  |

---

### Notas rápidas...

- Las aplicaciones a usar se cambiaban en `apps.lua`
- Según yo del pasado, en algún lado hay easter eggs. No me acuerdo donde.
- Las configuraciones "hardcoded" de Neofetch eran por estética. Ajustalas a como necesites.
- El "powermenu" menciona mejor al presionar las combinaciones de teclas más que presionando los botones. 
Al parecer se usaban asi:

  | Tecla         | Acción     |
  | ----------- | -------- |
  |  p          | Apagado |
  |  r          | Reinicio  |
  |  s          | Suspención  |
  |  q          | Salir de AwesomeWm |
  |  l          | Bloqueo de Pantalla    |


## Cosas que nunca termine con estos dotfiles.

- Mejorar las notificaciones
- Limpiar el código (AwesomeWM tiene, o tenía, archivos muy grandes de configuración) 
- Arreglar el problema del powermenu.

---

## Inspiraciones:

- [Gogh-Co Terminal Palletes](https://github.com/Gogh-Co/Gogh)
- [N3k0Ch4n](https://github.com/N3k0Ch4n/)
- [Chris Titus Awesome Theme](https://github.com/ChrisTitusTech/titus-awesome)
- [Catpuccin Community's Rofi Theme](https://github.com/catppuccin/rofi)
- Y al culpable de todo, _r/unixporn_

---

## Gracias directas e indirectas: 

- [Saimoom/Harry](https://github.com/saimoomedits/dotfiles)
- [Elenapan](https://github.com/elenapan/dotfiles)
- [Ner0z](https://github.com/ner0z/dotfiles)
- [unix-parrot](https://github.com/unix-parrot)
- [Rocky_reddit](https://www.reddit.com/user/Rocky_reddit)

<br>

