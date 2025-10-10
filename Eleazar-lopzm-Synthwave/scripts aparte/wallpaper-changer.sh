#!/bin/bash

# Directorio con tus wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapersact"
# Escoge una imagen aleatoria (jpg o png)
IMAGE=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Si se encontró una imagen, aplicar como fondo
if [[ -n "$IMAGE" ]]; then
  swaymsg output "*" bg "$IMAGE" fill
else
  echo "No se encontraron imágenes en $WALLPAPER_DIR" >&2
fi
