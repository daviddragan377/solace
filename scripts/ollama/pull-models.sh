#!/usr/bin/env sh
set -euo pipefail

MODELS="
llama3.1:70b-instruct-q4_K_M
llama3.1:8b-instruct-q6_K
deepseek-r1:32b
qwen2.5:32b
mistral-nemo:12b-instruct
nomic-embed-text:latest
snowflake-arctic-embed:335m
whisper:medium
"

if ! command -v ollama >/dev/null 2>&1; then
  echo "[pull-models] ollama CLI not found. Run inside the LibreChat-Ollama container or install Ollama locally." >&2
  exit 1
fi

for model in $MODELS; do
  echo "[pull-models] pulling $model"
  ollama pull "$model"
done
