#!/usr/bin/env sh
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <audio-file>" >&2
  exit 1
fi

AUDIO_PATH="$1"
MODEL="whisper:medium"

if ! command -v ollama >/dev/null 2>&1; then
  echo "[transcribe] ollama CLI not found. Run inside LibreChat-Ollama container or install Ollama locally." >&2
  exit 1
fi

if [ ! -f "$AUDIO_PATH" ]; then
  echo "[transcribe] file not found: $AUDIO_PATH" >&2
  exit 1
fi

ollama run "$MODEL" --file "$AUDIO_PATH"
