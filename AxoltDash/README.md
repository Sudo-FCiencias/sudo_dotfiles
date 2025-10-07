# AxoltDash Dotfiles 🔧

¡Bienvenido a mi colección personal de dotfiles! Este repositorio contiene mis configuraciones personalizadas para diversos programas y mi sistema operativo NixOS.

## 🤔 ¿Qué es todo esto? (Para principiantes)

Si eres nuevo en el mundo del **"ricing"** (personalización de tu escritorio Linux), aquí tienes una explicación rápida:

### 🎨 ¿Qué es el "Ricing"?
**Ricing** es el término que usa la comunidad Linux para referirse a la personalización profunda del escritorio y las aplicaciones. El objetivo es hacer que tu sistema se vea y funcione exactamente como tú quieres.

### 📄 ¿Qué son los "Dotfiles"?
Los **dotfiles** son archivos de configuración que comienzan con un punto (.) y están ocultos por defecto. Estos archivos controlan cómo se ven y comportan tus aplicaciones:
- `.bashrc` - Configuración de tu terminal
- `.vimrc` - Configuración de Vim/Neovim
- `.config/waybar/config` - Configuración de la barra de estado
- Y muchos más...

### 🏠 ¿Qué es NixOS?
**NixOS** es una distribución de Linux especial que gestiona todo el sistema a través de archivos de configuración. Es como tener "dotfiles" para todo tu sistema operativo:
- **Ventajas**: Sistema reproducible, fácil rollback, configuración declarativa
- **Desventajas**: Curva de aprendizaje pronunciada
- **¿Lo necesito?**: ¡NO! Puedes usar los dotfiles individuales en cualquier distribución

### 🛠️ Términos que verás aquí:
- **Wayland**: Protocolo moderno para mostrar ventanas (reemplazo de X11)
- **Hyprland**: Un "compositor" - básicamente tu gestor de ventanas para Wayland
- **Waybar**: Una barra superior/inferior que muestra información del sistema
- **Home Manager**: Herramienta de NixOS para gestionar configuraciones de usuario
- **Flakes**: Sistema moderno de NixOS para gestionar dependencias

## 📁 Estructura del Repositorio

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
├── dotfiles/                # Configuraciones de aplicaciones (EN DESARROLLO)
│   ├── waybar/              # Barra de estado para Wayland (próximamente)
│   ├── hyprland/            # Compositor de ventanas (próximamente)  
│   ├── vim/                 # Editor de texto (próximamente)
│   └── ...                  # Más configuraciones por venir
└── assets/                  # Recursos visuales y extras
```

## 🖥️ NixOS Configuration (Completamente Opcional)

> **⚠️ IMPORTANTE**: La configuración de NixOS es completamente **OPCIONAL**. No necesitas usar NixOS para aprovechar los dotfiles de las aplicaciones individuales.

La carpeta `nixfiles/` contiene mi configuración completa del sistema operativo NixOS. Esta incluye:

- **Sistema base**: Configuración del kernel, drivers y servicios
- **Entorno de escritorio**: Hyprland, Waybar y aplicaciones relacionadas
- **Paquetes**: Todas las aplicaciones que uso regularmente
- **Home Manager**: Gestión declarativa de la configuración del usuario

Si usas NixOS y quieres replicar mi sistema completo, puedes usar estos archivos. Para más detalles, consulta el [README de nixfiles](nixfiles/README.md).

## 📦 Dotfiles Individuales (En Desarrollo)

Los dotfiles en la carpeta `dotfiles/` están diseñados para ser **independientes del sistema operativo**. Puedes usar estas configuraciones en:

- **Arch Linux**
- **Ubuntu/Debian**  
- **Fedora**
- **macOS**
- **Cualquier distribución de Linux**

### Aplicaciones Incluidas (Próximamente)

- **Waybar**: Barra de estado personalizada para Wayland
- **Hyprland**: Configuración del compositor de ventanas
- **Vim/Neovim**: Configuración del editor de texto
- **Zsh**: Shell y prompt personalizado
- **Git**: Configuración y aliases
- **Y más...**

## 🚀 Instalación Rápida

### Opción 1: Solo Dotfiles (Recomendado para la mayoría)

```bash
# Clona el repositorio
git clone https://github.com/Sudo-FCiencias/sudo_dotfiles.git
cd sudo_dotfiles/AxoltDash

# Navega a los dotfiles específicos que necesites
cd dotfiles/
# Luego copia o enlaza simbólicamente los archivos que necesites
```

### Opción 2: Sistema Completo NixOS (Solo para usuarios de NixOS)

```bash
# Clona el repositorio
git clone https://github.com/Sudo-FCiencias/sudo_dotfiles.git
cd sudo_dotfiles/AxoltDash/nixfiles

# Reconstruye el sistema (requiere NixOS)
sudo nixos-rebuild switch --flake .
```

## ⚠️ Advertencias Importantes

1. **Personalización**: Estos dotfiles están adaptados a mis necesidades específicas
2. **Backup**: Siempre haz un respaldo de tus configuraciones actuales antes de usar las mías
3. **Compatibilidad**: Revisa los requisitos de cada aplicación antes de instalar
4. **NixOS Opcional**: No necesitas NixOS para usar los dotfiles individuales

## 🛠️ Personalización

Siéntete libre de:
- Forkear este repositorio
- Modificar las configuraciones según tus necesidades
- Tomar solo las partes que te interesen
- Contribuir con mejoras

## 📄 Licencia

Este proyecto está bajo la [Licencia MIT](../LICENSE). Úsalo libremente pero bajo tu propio riesgo.

---

**Nota**: Este repositorio está en desarrollo activo. Los dotfiles individuales se están agregando gradualmente. ¡Mantente atento a las actualizaciones!
