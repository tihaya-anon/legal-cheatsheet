#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FONT_DIR="${ROOT_DIR}/cheatsheet/fonts"
mkdir -p "${FONT_DIR}"

echo "Downloading fonts into: ${FONT_DIR}"

have_cmd() {
  command -v "$1" >/dev/null 2>&1
}

download_if_missing() {
  local output_path="$1"
  local url="$2"

  if [[ -f "${output_path}" ]]; then
    echo "Skip (exists): ${output_path}"
    return 0
  fi

  echo "Download: ${output_path}"
  curl -fL --retry 3 --retry-delay 1 -o "${output_path}" "${url}"
}

if ! have_cmd curl; then
  echo "Error: curl is required but not found."
  exit 1
fi

# Chinese Songti-style font (open source): Noto Serif CJK SC
# Typst family name: Noto Serif CJK SC
download_if_missing \
  "${FONT_DIR}/NotoSerifCJKsc-Regular.otf" \
  "https://raw.githubusercontent.com/notofonts/noto-cjk/main/Serif/OTF/SimplifiedChinese/NotoSerifCJKsc-Regular.otf"

# Times New Roman cannot be redistributed directly.
# Use Tinos as a metrically-compatible free alternative.
# Typst family name: Tinos
download_if_missing \
  "${FONT_DIR}/Tinos-Regular.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/tinos/Tinos-Regular.ttf"

download_if_missing \
  "${FONT_DIR}/Tinos-Bold.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/tinos/Tinos-Bold.ttf"

download_if_missing \
  "${FONT_DIR}/Tinos-Italic.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/tinos/Tinos-Italic.ttf"

download_if_missing \
  "${FONT_DIR}/Tinos-BoldItalic.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/tinos/Tinos-BoldItalic.ttf"

echo
echo "Done."
echo "Font files:"
ls -lh "${FONT_DIR}"

echo
echo "If you have a licensed Times New Roman, you may also copy these files into ${FONT_DIR}:"
echo "  - times.ttf"
echo "  - timesbd.ttf"
echo "  - timesi.ttf"
echo "  - timesbi.ttf"
