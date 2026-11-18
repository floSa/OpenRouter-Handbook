"""Annote une capture : rectangle rouge et pastille numérotée par élément.

Usage : uv run --with pillow python outils/annoter.py <source> <cible.png> "x0,y0,x1,y1" [...] ["m:x0,y0,x1,y1" pour masquer une zone]
Coordonnées dans le repère de la capture (1568 x 726 pour une fenêtre Chrome standard de l'essai).
"""
import sys

from PIL import Image, ImageDraw, ImageFont

source, cible, *zones = sys.argv[1:]
img = Image.open(source).convert("RGB")
d = ImageDraw.Draw(img)
try:
    police = ImageFont.truetype("DejaVuSans-Bold.ttf", 15)
except OSError:
    police = ImageFont.load_default()
masques = [z[2:] for z in zones if z.startswith("m:")]
zones = [z for z in zones if not z.startswith("m:")]
for m in masques:  # zone recouverte (clé, données personnelles)
    x0, y0, x1, y1 = (int(v) for v in m.split(","))
    d.rectangle((x0, y0, x1, y1), fill=(40, 40, 40))
    d.text(((x0 + x1) // 2, (y0 + y1) // 2), "masqué", fill="white", font=police, anchor="mm")
for i, z in enumerate(zones, 1):
    x0, y0, x1, y1 = (int(v) for v in z.split(","))
    d.rectangle((x0, y0, x1, y1), outline=(230, 30, 30), width=3)
    r = 12
    cx, cy = max(x0 - 4, r + 1), max(y0 - 4, r + 1)
    d.ellipse((cx - r, cy - r, cx + r, cy + r), fill=(230, 30, 30))
    d.text((cx, cy), str(i), fill="white", font=police, anchor="mm")
img.save(cible, optimize=True)
print(cible, img.size)
