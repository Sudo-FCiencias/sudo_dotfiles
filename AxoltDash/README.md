# AxoltDash Dotfiles 🔧

¡Bienvenido a mi colección personal de dotfiles! Este repositorio contiene mis configuraciones personalizadas para diversos programas y mi sistema operativo NixOS.

## 🤔 - ¿Qué es todo esto? (Para principiantes)

Si eres nuevo en el mundo del **"ricing"** (personalización de tu escritorio Linux), aquí tienes una explicación rápida:

### 🎨 - ¿Qué es el "Ricing"?
**Ricing** es el término que usa la comunidad Linux para referirse a la personalización profunda del escritorio y las aplicaciones. El objetivo es hacer que tu sistema se vea y funcione exactamente como tú quieres.

### 📄 - ¿Qué son los "Dotfiles"?
Los **dotfiles** son archivos de configuración que comienzan con un punto (.) y están ocultos por defecto. Estos archivos controlan cómo se ven y comportan tus aplicaciones:
- `.bashrc` - Configuración de tu terminal
- `.vimrc` - Configuración de Vim/Neovim
- `.config/waybar/config` - Configuración de la barra de estado
- Y muchos más...

### 🏠 - ¿Qué es NixOS?
**NixOS** es una distribución de Linux especial que gestiona todo el sistema a través de archivos de configuración. Es como tener "dotfiles" para todo tu sistema operativo:
- **Ventajas**: Sistema reproducible, fácil rollback, configuración declarativa
- **Desventajas**: Curva de aprendizaje pronunciada
- **¿Lo necesito?**: ¡NO! Puedes usar los dotfiles individuales en cualquier distribución

### 🛠️ - Términos que verás aquí:
- **Wayland**: Protocolo moderno para mostrar ventanas (reemplazo de X11)
- **Hyprland**: Un "compositor" - básicamente tu gestor de ventanas para Wayland
- **Waybar**: Una barra superior/inferior que muestra información del sistema
- **Home Manager**: Herramienta de NixOS para gestionar configuraciones de usuario
- **Flakes**: Sistema moderno de NixOS para gestionar dependencias

## 📁 - Estructura del Repositorio

```
AxoltDash/
├── README.md                 # Información general del proyecto
├── nixfiles/                 # Configuración completa de NixOS (OPCIONAL)
│   ├── configuration.nix     # Configuración principal del sistema
│   ├── flake.nix            # Gestión de dependencias con Nix Flakes
│   ├── home/                # Configuración del usuario con Home Manager
│   ├── nixos/               # Configuraciones específicas del sistema
│   ├── pkgs/                # Paquetes y aplicaciones
│   └── scripts/             # Scripts de utilidad
├── dotfiles/                # Configuraciones de aplicaciones ✅ DISPONIBLES
│   ├── README.md            # Guía de los dotfiles individuales
│   ├── btop/                # Monitor de sistema con temas personalizados
│   ├── fastfetch/           # Información del sistema con logo personalizado
│   ├── hypr/                # Hyprland + Hyprlock + Hyprpaper + scripts
│   ├── kitty/               # Terminal con tema LightMoss
│   ├── nvim/                # Neovim completamente configurado
│   ├── rofi/                # Lanzador de aplicaciones con scripts
│   ├── waybar/              # Barra de estado personalizada
│   └── zathura/             # Visor de PDF minimalista
└── assets/                  # Recursos visuales y extras (TENGO Q PONERLO ALV JEJE)
```

## 🖥️ NixOS Configuration (Completamente Opcional)

> **⚠️ - IMPORTANTE**: La configuración de NixOS es completamente **OPCIONAL**. No necesitas usar NixOS para aprovechar los dotfiles de las aplicaciones individuales.

La carpeta `nixfiles/` contiene mi configuración completa del sistema operativo NixOS. Esta incluye:

- **Sistema base**: Configuración del kernel, drivers y servicios
- **Entorno de escritorio**: Hyprland, Waybar y aplicaciones relacionadas
- **Paquetes**: Todas las aplicaciones que uso regularmente
- **Home Manager**: Gestión declarativa de la configuración del usuario

Si usas NixOS y quieres replicar mi sistema completo, puedes usar estos archivos. Para más detalles, consulta el [README de nixfiles](nixfiles/README.md).

## 📦 - Dotfiles Individuales

Los dotfiles en la carpeta `dotfiles/` están diseñados para ser **independientes del sistema operativo**. Puedes usar estas configuraciones en:

- **Arch Linux**
- **Ubuntu/Debian**  
- **Fedora**
- **Cualquier distribución de Linux**

### 🎯 - Aplicaciones Configuradas principales

#### 🖥️ - **Entorno de Escritorio**
- **[Hyprland](dotfiles/hypr/)**: Compositor de ventanas Wayland moderno y eficiente
  - `hyprland.conf` - Configuración principal con atajos y reglas de ventana
  - `hyprlock.conf` - Pantalla de bloqueo personalizada
  - `hyprpaper.conf` - Gestor de wallpapers
  - `scripts/` - Scripts de utilidad (notificaciones de batería, etc.)

- **[Waybar](dotfiles/waybar/)**: Barra de estado altamente personalizable
  - `config.jsonc` - Configuración de módulos y layout
  - `style.css` - Estilos visuales personalizados
  - `scripts/` - Scripts para filtro de luz azul y más

#### 🚀 - **Aplicaciones**
- **[Kitty](dotfiles/kitty/)**: Terminal GPU-accelerated con tema LightMoss
- **[Neovim](dotfiles/nvim/)**: Editor completamente configurado con plugins
  - LSP, completado, Git, temas, y mucho más
  - Configuración modular en Lua
- **[Rofi](dotfiles/rofi/)**: Lanzador de aplicaciones con tema personalizado
  - Scripts para gitmoji y control de sonido
- **[Btop](dotfiles/btop/)**: Monitor de sistema con temas personalizados
- **[Fastfetch](dotfiles/fastfetch/)**: Información del sistema con logo personalizado
- **[Zathura](dotfiles/zathura/)**: Visor de PDF minimalista y rápido

#### 🎨 - **Tema Visual**
La mayoría de las configuraciones utilizan mi propio tema inventado llamado **LightMoss**, llevo un tiempo trabajando en el, ya que, todavía no unifico todos los colores en una sola paleta simple. Por lo que en pocas palabras, está incompleto.

## 🚀 - Instalación Rápida

### Opción 1: Solo Dotfiles (Recomendado para la mayoría)

```bash
# Clona el repositorio
git clone https://github.com/Sudo-FCiencias/sudo_dotfiles.git
cd sudo_dotfiles/AxoltDash/dotfiles

# Ejemplo: Instalar configuración de Kitty
cp -r kitty/ ~/.config/

# Ejemplo: Instalar configuración de Neovim
cp -r nvim/ ~/.config/

# Ejemplo: Instalar configuración de Hyprland
cp -r hypr/ ~/.config/

# O crea enlaces simbólicos para actualizaciones automáticas
ln -sf $(pwd)/kitty ~/.config/
ln -sf $(pwd)/nvim ~/.config/
```
No solo necesitas los archivos, necesitas instalar las aplicaciones necesarias. Checa la documentación de `dotfiles/README.md`.

### Opción 2: Sistema Completo NixOS (Solo para usuarios de NixOS)

```bash
# Clona el repositorio
git clone https://github.com/Sudo-FCiencias/sudo_dotfiles.git
cd sudo_dotfiles/AxoltDash/nixfiles

# Reconstruye el sistema (requiere NixOS)
sudo nixos-rebuild switch --flake .
```
Eso si, he de advertir de que `nixfiles/` es una copia modificada de un repositorio personal privado para poder compartirlo aquí en el showcase, pero no esta destinado para que sea usado directamente (Tiene paquetes que estan destinados a mi tipo de hardware por ejemplo). Asi que la documentación no es la mejor, usalo como referencia, no como uso directo. 

## ⚠️ - Advertencias Importantes

1. **Personalización**: Estos dotfiles están adaptados a mis necesidades específicas
2. **Backup**: Siempre haz un respaldo de tus configuraciones actuales antes de usar las mías
3. **Compatibilidad**: Revisa los requisitos de cada aplicación antes de instalar
4. **NixOS Opcional**: No necesitas NixOS para usar los dotfiles individuales
5. **Cosas que no están mencionadas en los dotfiles**: Hay cosas que NO se encuentran en las configuraciones de los dotfiles directamente, por ejemplo, los temas GTK y QT son protocolos que se encargan de "colorear" muchas aplicaciones de Linux, esos se instalan por aparte. (Checa el tema [Gruvbox Material GTK](https://github.com/TheGreatMcPain/gruvbox-material-gtk) que es el que yo uso)

## 🛠️ - Personalización

Siéntete libre de:
- Modificar las configuraciones según tus necesidades
- Tomar solo las partes que te interesen

## 📄 - Licencia

Este proyecto está bajo la [Licencia MIT](../LICENSE). Úsalo libremente pero bajo tu propio riesgo.