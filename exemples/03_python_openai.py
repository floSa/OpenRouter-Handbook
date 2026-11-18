"""Le même appel avec la bibliothèque officielle d'OpenAI : seule l'adresse change.

Lancement : uv run --with openai python exemples/03_python_openai.py
"""
import os
from pathlib import Path

from openai import OpenAI

for l in (Path(__file__).resolve().parents[1] / ".env").read_text().splitlines():
    if l.startswith("OPENROUTER_API_KEY="):
        os.environ["OPENROUTER_API_KEY"] = l.split("=", 1)[1]

client = OpenAI(base_url="https://openrouter.ai/api/v1", api_key=os.environ["OPENROUTER_API_KEY"])
r = client.chat.completions.create(
    model="inclusionai/ling-3.2-flash:free",
    messages=[{"role": "user", "content": "Cite trois usages d'une passerelle de modèles, en une ligne chacun."}],
)
print("modèle :", r.model)
print(r.choices[0].message.content.strip())
