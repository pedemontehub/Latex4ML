#!/usr/bin/env bash
# Run a presentation Python script to generate its .pptx file.
# Usage: ./scripts/compile.sh <path/to/presentation.py>
set -euo pipefail

usage() {
  echo "Usage: $0 <presentation.py>"
  echo ""
  echo "Examples:"
  echo "  $0 presentations/my_talk.py"
  echo "  $0 examples/neural_networks_intro.py"
  exit 1
}

[[ $# -lt 1 ]] && usage

PY_FILE="$1"

if [[ ! -f "$PY_FILE" ]]; then
  echo "Error: file not found: $PY_FILE"
  exit 1
fi

echo "Running: python $PY_FILE"
python "$PY_FILE"
