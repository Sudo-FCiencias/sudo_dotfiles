<h2 align='center'>
 Go with the (nord)flow...
</h2>

<br>

Ahhhhg, Nordflow. Este fue mi rice por creo que año y medio. Fue la configuración que me hizo tenerle cariño a Arch. Y todo fue felicidad...hasta que tuve que cambiarme a otra distro por la chamba. 

Nordlflow es más un remix del tema _Adaptive_ que viene incluido en [Archcraft](https://archcraft.io/), 
más en específico para Openbox. Por lo mismo, este rice está pensando para funcionar en distros Arch, aunque
quizá con los ajustes necesarios pueda servir en otro lado.

Eso si, como si ajusté varios archivos de la configuración base, preferí tener e incluir una copia de ellos en sus carpetas correspondientes (según aplique). Como, de nuevo, es un más un remix que una idea 100% original, y en honor a su creador original, Aditya Shakya, he decidido mantener su firma en los archivos de sus scripts.


# Configuración de Sistema
- **OS** - Archcraft
- **WM** - Openbox
- **Barra de Estado** - Polybar
- **Terminal** - Alacritty + pfetch + JetBrains Mono Nerd
- **Compositor** - Picom
- **Menu/Launcher/Window Switcher** - Rofi
- **Shell** - Zsh + Powerlevel10k + Colorls
- **Reproductor Musical** - Spicetify w/Sleek Nord Theme
- **Wallpapers** Originalmente del repo de [Nordic Wallpapers](https://github.com/linuxdotexe/nordic-wallpapers), pero los usados están en los archivos del repo.
- **Editor** Pycharm con el tema Material Nord.

## Configuración de Navegador

- **Navegador** - Brave w/ [Nord Theme](https://chromewebstore.google.com/detail/nord-theme/dhlnjfhjjbminbjbegeiijdakdkamjoi)
- **Extensiones** - [Notion Enhancer](https://github.com/notion-enhancer/notion-enhancer) + [Notion Themes](https://github.com/notionblog/NotionThemes) [Nota: Estas ya no sirven, pero pongo lo que se ocupaba en ese entonces.]
- **Buscador** - DuckDuckGo. En Ajustes/Apariencia puedes cargar la configuración de colores (y un par de cosas más) usando la clave **gowiththenordflow**.

## ¡Así se veía Nordflow!

<img widht="300px" src="desktop.png">
<img widht="300px" src="fetch.png">
<img widht="300px" src="notion.png">
<img widht="300px" src="jetbrains.png">
<img widht="300px" src="spicetify.png">
<img widht="300px" src="thunar.png">
<img widht="300px" src="rofi.png">
<img widht="300px" src="locked.png">


## Dependencias

De nuevo, las que me acuerdo. 

```sh
sudo pacman -Syu alacritty playerctl openbox nerd-fonts-jetbrains-mono ttf-jetbrains-mono brightnessctl networkmanager alsa-utils alsa-plugins alsa-firmware zsh betterlockscreen thunar vlc pfetch polybar
```

```sh
yay spicetify bat gotop colorls
```


## Algunos keybinds

| Keybinds    | Lanza |
| ----------- | -------- |
| `Super` + x     | Terminal |
| `Super` + z     | Brave |
| `Super` + r     | Rofi  |
| `Super` + q     | Cierra la ventana   |
| `Super` + s     | Menu de Screenshots|
| `Super`+ n | Minimiza la pantalla |
| `Super` + d | Muestra el escritorio |
| `Super` + e | Abre el explorador de archivos |

La forma más fácil de ver que keybinds funcionan es revisar [kbinds.txt](../openbox/kbinds.txt), pero para ajustarlos hay
que hacerlo en [rc.xml](../openbox/rc.xml).