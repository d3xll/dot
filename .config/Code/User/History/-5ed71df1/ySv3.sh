#!/usr/bin/env bash

# Классическая палитра Papirus (имя цвета → hex код)
declare -A colors=(
  [adwaita]="#5294E2"
  [black]="#000000"
  [blue]="#2196F3"
  [bluegrey]="#607D8B"
  [breeze]="#2980B9"
  [brown]="#795548"
  [carmine]="#C62828"
  [cyan]="#00BCD4"
  [darkcyan]="#008B8B"
  [deeporange]="#FF5722"
  [green]="#4CAF50"
  [grey]="#9E9E9E"
  [indigo]="#3F51B5"
  [magenta]="#E91E63"
  [nordic]="#88C0D0"
  [orange]="#FF9800"
  [palebrown]="#A1887F"
  [paleorange]="#FFCCBC"
  [pink]="#EC407A"
  [red]="#F44336"
  [teal]="#009688"
  [violet]="#9C27B0"
  [white]="#FFFFFF"
  [yaru]="#E95420"
  [yellow]="#FFEB3B"
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
  distance=$(( (r1 - r2)**2 + (g1 - g2)**2 + (b1 - b2)**2 ))
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
