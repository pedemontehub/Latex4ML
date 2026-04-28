#!/usr/bin/env bash
# Compile a LaTeX Beamer .tex file to PDF.
# Usage: ./scripts/compile.sh <path/to/file.tex> [--bibtex]
set -euo pipefail

usage() {
  echo "Usage: $0 <file.tex> [--bibtex]"
  echo ""
  echo "Options:"
  echo "  --bibtex   Run bibtex between pdflatex passes (for bibliographies)"
  echo ""
  echo "Examples:"
  echo "  $0 presentations/my-talk.tex"
  echo "  $0 presentations/my-paper.tex --bibtex"
  exit 1
}

[[ $# -lt 1 ]] && usage

TEX_FILE="$1"
USE_BIBTEX=false

for arg in "$@"; do
  [[ "$arg" == "--bibtex" ]] && USE_BIBTEX=true
done

if [[ ! -f "$TEX_FILE" ]]; then
  echo "Error: file not found: $TEX_FILE"
  exit 1
fi

TEX_DIR="$(dirname "$TEX_FILE")"
TEX_BASE="$(basename "$TEX_FILE" .tex)"

echo "Compiling: $TEX_FILE"
echo "Output dir: $TEX_DIR"

cd "$TEX_DIR"

pdflatex -interaction=nonstopmode -halt-on-error "${TEX_BASE}.tex"

if $USE_BIBTEX; then
  echo "Running bibtex..."
  bibtex "${TEX_BASE}" || true
  pdflatex -interaction=nonstopmode -halt-on-error "${TEX_BASE}.tex"
fi

pdflatex -interaction=nonstopmode -halt-on-error "${TEX_BASE}.tex"

PDF="${TEX_BASE}.pdf"
if [[ -f "$PDF" ]]; then
  echo ""
  echo "Success! Output: ${TEX_DIR}/${PDF}"
else
  echo "Error: PDF not generated. Check the log: ${TEX_BASE}.log"
  exit 1
fi
