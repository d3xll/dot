#!/usr/bin/env bash

# Классическая палитра Papirus (имя цвета → hex код)
declare -A colors=(
  [adwaita]="#93c0ea"
  [black]="#797979"
  [blue]="#5294e2"
  [bluegrey]="#869aa4"      # исправлено с bluegray на правильное имя
  [breeze]="#57b8ec"
  [brown]="#bda68e"
  [carmine]="#a30002"
  [cyan]="#41c7d8"
  [darkcyan]="#45abb7"
  [deeporange]="#e98a68"
  [green]="#a1bf80"
  [grey]="#a6a6a6"
  [indigo]="#838dca"
  [magenta]="#d192e0"
  [nordic]="#9db4cb"
  [orange]="#eba96a"
  [palebrown]="#d6c9bd"
  [paleorange]="#ebd1a7"
  [pink]="#ec87a9"
  [red]="#e27c7c"
  [teal]="#159a80"
  [violet]="#9b7fcb"
  [white]="#e4e4e4"
  [yellow]="#f3c863"
)

# Hex код из файла (primary от matugen)
hex=$(<~/.cache/matugen/papirus)

# Функция HEX → RGB
hex_to_rgb() {
  local hex=$1
  local r=$((16#${hex:1:2}))
  local g=$((16#${hex:3:2}))
  local b=$((16#${hex:5:2}))
  echo "$r $g $b"
}

read r1 g1 b1 <<< "$(hex_to_rgb "$hex")"

# Поиск ближайшего цвета
min_distance=1000000
closest_color=""
for name in "${!colors[@]}"; do
  read r2 g2 b2 <<< "$(hex_to_rgb "${colors[$name]}")"
  distance=$(( (r1 - r2) * (r1 - r2) + (g1 - g2) * (g1 - g2) + (b1 - b2) * (b1 - b2) ))
  if (( distance < min_distance )); then
    min_distance=$distance
    closest_color=$name
  fi
done

echo "Closest Papirus color to $hex is: $closest_color"

# Применение цвета
# Если papirus-folders в PATH — используй просто papirus-folders
# Если у тебя локальная копка — оставь путь
papirus-folders -C "$closest_color" --theme Papirus-Dark
# Или если нужно указать путь к теме явно:
# ~/.local/share/icons/papirus-folders.sh -C "$closest_color" -t ~/.local/share/icons/Papirus-Dark
