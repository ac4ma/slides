#!/usr/bin/env bash
# Rebuild the HTML slides from the notebooks: exercise-N/slides.ipynb -> exercise-N/index.html
# Usage: ./build.sh            (with jupyter installed)
set -euo pipefail
cd "$(dirname "$0")"

for notebook in exercise-*/slides.ipynb; do
  dir=$(dirname "$notebook")
  jupyter nbconvert --to slides --SlidesExporter.reveal_scroll=True \
    --output-dir "$dir" --output index "$notebook"
  mv "$dir/index.slides.html" "$dir/index.html"
  title=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["metadata"].get("title", ""))' "$notebook")
  if [ -n "$title" ]; then
    python3 - "$dir/index.html" "$title" <<'PY'
import re, sys
path, title = sys.argv[1], sys.argv[2]
html = open(path, encoding="utf-8").read()
open(path, "w", encoding="utf-8").write(re.sub(r"<title>.*?</title>", f"<title>{title}</title>", html, count=1))
PY
  fi
  echo "built $dir/index.html"
done
