# Dependencias - Dotfiles de AxoltDash

Antes de usar estos dotfiles, asegúrate de instalar y conocer cada una de las aplicaciones asociadas. Por ejemplo, si quieres utilizar mi gestor de ventanas *Hyprland*, revisa su [sitio web oficial](https://hypr.land/) para entender su funcionamiento e instalación.

Los paquetes necesarios están distribuidos en `../nixfiles/pkgs/`, pero aquí tienes una recopilación de los más importantes (puede que falte alguno). Consulta los enlaces para instalar según tu distribución.

### Aplicaciones principales utilizadas en los dotfiles

- [Hyprland](https://hypr.land/)
- [Hyprlock](https://github.com/hyprwm/hyprlock/)
- [Hyprpaper](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
- [Hyprshade](https://github.com/loqusion/hyprshade)
- [Waybar](https://github.com/Alexays/Waybar)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Neovim](https://neovim.io/)
- [Rofi (Wayland port)](https://github.com/lbonn/rofi)
- [btop](https://github.com/aristocratos/btop)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Zathura-pdf](https://pwmt.org/projects/zathura/)
- [JetBrains Nerd Font](https://www.nerdfonts.com/font-downloads)
- [Nautilus (gestor de archivos)](https://apps.gnome.org/Nautilus/)

### Aplicaciones que solo son decorativas

- [Cava](https://github.com/karlstav/cava) (Visualizador de sonido en terminal)
- [Cbonsai](https://gitlab.com/jallbrit/cbonsai) (Generador de bonsais en tu terminal con ASCII) 
- [Activate-Linux](https://github.com/MrGlockenspiel/activate-linux) (Mensaje similar a windows para activar linux)
- [Cmatrix](https://github.com/abishekvashok/cmatrix) (Simbolos aleatorios en tu terminal simulando el entorno de matrix)

### Otras aplicaciones recomendadas para mejorar tu experiencia en Linux

- [Zen Browser](https://zen-browser.app/) (navegador web basado en Firefox)
- [Obsidian](https://obsidian.md/) (aplicación avanzada para toma de notas)
- [Lazygit](https://github.com/jesseduffield/lazygit) (gestor de Git en terminal)
- [Qalculate!](https://qalculate.github.io/) (calculadora potente)
- [Anki](https://apps.ankiweb.net/) (aplicación de tarjetas para estudio)
- [Ly](https://github.com/fairyglade/ly) (Display manager ultra ligero en terminal, perfecto si tienes una pc lenta y necesitas iniciar sesión más rápido)

> **Nota:** La fuente *Rainworld* se utiliza en varias configuraciones. Puedes encontrarla en `../nixfiles/extrafiles/RainworldSymbols.ttf`. Instálala manualmente siguiendo las instrucciones en `../nixfiles/extrafiles/instructions/instructions.md`.

## 🔧 Instalación de Dotfiles

```bash
# Clonar repositorio
git clone https://github.com/Sudo-FCiencias/sudo_dotfiles.git
cd sudo_dotfiles/AxoltDash/dotfiles

# Instalar configuraciones (ejemplo)
cp -r hypr/ ~/.config/
cp -r waybar/ ~/.config/
cp -r kitty/ ~/.config/
cp -r nvim/ ~/.config/
# ... etc para cada app que uses
```
