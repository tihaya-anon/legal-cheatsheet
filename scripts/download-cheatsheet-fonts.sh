#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FONT_DIR="${ROOT_DIR}/cheatsheet/fonts"
mkdir -p "${FONT_DIR}"

echo "Downloading fonts into: ${FONT_DIR}"

download_if_missing() {
  local out="$1"
  local url="$2"
  if [[ -f "${out}" ]]; then
    echo "Skip (exists): ${out}"
    return 0
  fi
  echo "Download: ${out}"
  curl -fL -o "${out}" "${url}"
}

download_if_missing \
  "${FONT_DIR}/Tinos-Regular.ttf" \
  "https://github.com/google/fonts/raw/main/ofl/tinos/Tinos-Regular.ttf"

download_if_missing \
  "${FONT_DIR}/NotoSerifCJKsc-Regular.otf" \
  "https://github.com/notofonts/noto-cjk/raw/main/Serif/OTF/SimplifiedChinese/NotoSerifCJKsc-Regular.otf"

download_if_missing \
  "${FONT_DIR}/NotoSansCJKsc-Regular.otf" \
  "https://github.com/notofonts/noto-cjk/raw/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf"

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
