#!/usr/bin/env bash
# Синхронизирует общий код и контент из ПУБЛИЧНОЙ версии (этот репозиторий,
# azkar-app — основная рабочая) в СЕМЕЙНУЮ (azkary).
# personal/ НЕ копируется — у версий разные учётки.
#
# Запускать из публичной папки. Использование:
#   ./sync-family.sh              # цель по умолчанию: ~/projects/azkary
#   ./sync-family.sh /путь/к/azkary
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:-$HOME/projects/azkary}"

if [ ! -d "$DEST" ]; then
  echo "Папка назначения не найдена: $DEST" >&2
  exit 1
fi

cp "$SRC/azkary.html"  "$DEST/azkary.html"
cp "$SRC/content.json" "$DEST/content.json"
echo "Синхронизировано (публичная → семейная) → $DEST :"
echo "  azkary.html"
echo "  content.json"
echo "personal/ намеренно не трогается."
echo
echo "Дальше закоммить и запушь ОБА репозитория (azkar-app и azkary)."
