#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FONT_DIR="${ROOT_DIR}/cheatsheet/fonts"
mkdir -p "${FONT_DIR}"

echo "Downloading fonts into: ${FONT_DIR}"

if [[ -f "${FONT_DIR}/DejaVuSerif.ttf" ]]; then
  echo "Skip (exists): ${FONT_DIR}/DejaVuSerif.ttf"
else
  TMP_ZIP="$(mktemp)"
  trap 'rm -f "${TMP_ZIP}"' EXIT
  echo "Download: ${FONT_DIR}/DejaVuSerif.ttf"
  curl -fL -o "${TMP_ZIP}" \
    "https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.zip"
  unzip -oj "${TMP_ZIP}" "dejavu-fonts-ttf-2.37/ttf/DejaVuSerif.ttf" -d "${FONT_DIR}" >/dev/null
fi

echo "Done."
echo "Font files:"
ls -lh "${FONT_DIR}"
