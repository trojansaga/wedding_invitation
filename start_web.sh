#!/bin/zsh
set -euo pipefail

PORT=9000

while [[ $# -gt 0 ]]; do
  case "$1" in
    --port)
      if [[ $# -lt 2 ]]; then
        echo "Missing value for --port" >&2
        exit 1
      fi
      PORT="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      echo "Usage: ./start_web.sh [--port <port>]" >&2
      exit 1
      ;;
  esac
done

exec python3 -m http.server "$PORT" --bind 0.0.0.0
