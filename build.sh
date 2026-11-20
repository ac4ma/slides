#!/usr/bin/env bash
# Rebuild the HTML slides from the notebooks of the exercise templates.
# Usage: ./build.sh            (from the slides folder, with jupyter installed)
# Expects the templates next to this folder: ../exercise-N-template/slides.ipynb
set -euo pipefail
cd "$(dirname "$0")"

for notebook in ../exercise-*-template/slides.ipynb; do
  name=$(basename "$(dirname "$notebook")" -template)      # exercise-2
  title=$(python3 -c 'import json,sys; nb=json.load(open(sys.argv[1])); print(nb["metadata"].get("title", ""))' "$notebook")
  mkdir -p "$name"
  jupyter nbconvert --to slides --SlidesExporter.reveal_scroll=True \
    --output-dir "$name" --output index "$notebook"
  mv "$name/index.slides.html" "$name/index.html"
  if [ -n "$title" ]; then
    python3 - "$name/index.html" "$title" <<'PY'
import re, sys
path, title = sys.argv[1], sys.argv[2]
html = open(path, encoding="utf-8").read()
open(path, "w", encoding="utf-8").write(re.sub(r"<title>.*?</title>", f"<title>{title}</title>", html, count=1))
PY
  fi
  echo "built $name/index.html"
done
