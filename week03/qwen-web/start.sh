#!/bin/bash
cd "$(dirname "$0")" || exit 1

if ! command -v pyhton3 >/dev/null 2>&1; then
    echo "pytho3을 먼저 설치 ㄱㄱ" >&2
    exit 1
fi

exec python3 chat.py


