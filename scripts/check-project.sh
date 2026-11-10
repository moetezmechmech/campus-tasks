#!/usr/bin/env bash
set -euo pipefail
for f in README.md .gitignore Dockerfile compose.yaml; do
  [ -f "$f" ] || { echo "Fichier manquant: $f" >&2; exit 1; }
done
if git ls-files --error-unmatch .env >/dev/null 2>&1; then
  echo ".env est suivi par Git" >&2
  exit 1
fi
echo "Projet OK"
