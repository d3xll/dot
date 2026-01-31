#!/usr/bin/env python3

import re
import math

# Точная палитра Papirus (имя → HEX)
colors = {
    "adwaita": "#93c0ea",
    "black": "#797979",
    "blue": "#5294e2",
    "bluegrey": "#869aa4",
    "breeze": "#57b8ec",
    "brown": "#bda68e",
    "carmine": "#a30002",
    "cyan": "#41c7d8",
    "darkcyan": "#45abb7",
    "deeporange": "#e98a68",
    "green": "#a1bf80",
    "grey": "#a6a6a6",
    "indigo": "#838dca",
    "magenta": "#d192e0",
    "nordic": "#9db4cb",
    "orange": "#eba96a",
    "palebrown": "#d6c9bd",
    "paleorange": "#ebd1a7",
    "pink": "#ec87a9",
    "red": "#e27c7c",
    "teal": "#159a80",
    "violet": "#9b7fcb",
    "white": "#e4e4e4",
    "yellow": "#f3c863",
}

# Функции конвертации RGB → XYZ → Lab
def rgb_to_xyz(rgb):
    r, g, b = [x / 255.0 for x in rgb]
    # sRGB to linear
    r = ((r + 0.055) / 1.055) ** 2.4 if r > 0.04045 else r / 12.92
    g = ((g + 0.055) / 1.055) ** 2.4 if g > 0.04045 else g / 12.92
    b = ((b + 0.055) / 1.055) ** 2.4 if b > 0.04045 else b / 12.92
    r *= 100
    g *= 100
    b *= 100
    x = r * 0.4124 + g * 0.3576 + b * 0.1805
    y = r * 0.2126 + g * 0.7152 + b * 0.0722
    z = r * 0.0193 + g * 0.1192 + b * 0.9505
    return x, y, z

def xyz_to_lab(xyz):
    x, y, z = xyz
    ref_x, ref_y, ref_z = 95.047, 100.0, 108.883  # D65
    x /= ref_x
    y /= ref_y
    z /= ref_z
    x = x ** (1/3) if x > 0.008856 else (7.787 * x) + (16/116)
    y = y ** (1/3) if y > 0.008856 else (7.787 * y) + (16/116)
    z = z ** (1/3) if z > 0.008856 else (7.787 * z) + (16/116)
    l = (116 * y) - 16
    a = 500 * (x - y)
    b = 200 * (y - z)
    return l, a, b

def hex_to_lab(hex_str):
    hex_str = hex_str.lstrip('#')
    if len(hex_str) == 3:
        hex_str = ''.join(c*2 for c in hex_str)
    rgb = tuple(int(hex_str[i:i+2], 16) for i in (0, 2, 4))
    return xyz_to_lab(rgb_to_xyz(rgb))

def delta_e_cie76(lab1, lab2):
    l1, a1, b1 = lab1
    l2, a2, b2 = lab2
    return math.sqrt((l1 - l2)**2 + (a1 - a2)**2 + (b1 - b2)**2)

# Читаем primary hex
file_path = "~/.config/matugen/papirus-folders/folder-color.txt"
with open(file_path.expanduser(file_path)) as f:
    hex_color = f.read().strip()

if not re.match(r'^#[0-9a-fA-F]{6}$', hex_color) and not re.match(r'^#[0-9a-fA-F]{3}$', hex_color):
    print(f"Ошибка: некорректный hex '{hex_color}'")
    exit(1)

primary_lab = hex_to_lab(hex_color)

# Поиск ближайшего
min_delta = float('inf')
closest_name = "blue"  # fallback

for name, hex_val in colors.items():
    palette_lab = hex_to_lab(hex_val)
    delta = delta_e_cie76(primary_lab, palette_lab)
    if delta < min_delta:
        min_delta = delta
        closest_name = name

print(f"Primary: {hex_color} → ближайший Papirus: {closest_name} (Delta E ≈ {min_delta:.2f})")

# Применяем
import subprocess
subprocess.run(["papirus-folders", "-C", closest_name, "--theme", "Papirus-Dark"])