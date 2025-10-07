# Configuración de NixOS de AxoltDash 🖥️
Este repositorio contiene mi configuración personal de NixOS. Incluye varios ajustes y paquetes para instalar y mantener el sistema.

<div align="center">
    <img src="extrafiles/nixos.png" alt="Terminal Welcome" width="100"/>
</div>

## LEE ESTO PRIMERO
Esta instalación no solo te permite personalizar el aspecto visual de tus aplicaciones utilizando mis dotfiles anteriores, sino que también, si deseas replicar todo mi sistema operativo con la distribución NixOS, puedes usar estos archivos como referencia.  
NixOS es una distribución de Linux que, en esencia, gestiona toda la configuración del sistema a través de archivos `.nix`.

## Instalación ⚙️
---
Necesitas clonar este repositorio en tu sistema para usar la configuración. Luego, debes reconstruir y opcionalmente actualizar los paquetes del sistema.

### Flakes ❄️
#### Reconstruir el sistema 🔄
```shell
sudo nixos-rebuild switch --flake nixos/
```

#### Actualizar el sistema ⬆️
```shell
sudo nix flake update nixos/
sudo nixos-rebuild switch --flake nixos/
```

## Atención ⚠️
Esta configuración está adaptada a mis necesidades y preferencias personales. Puede que no funcione para ti directamente. Puedes usarla como referencia o punto de partida para tu propia configuración.
Lee la carpeta `instructions/` para más información sobre cómo instalar otras cosas fuera de la configuración de NixOS.

## Licencia 📜

Este subrepositorio para este Dotfiles Showcase está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
