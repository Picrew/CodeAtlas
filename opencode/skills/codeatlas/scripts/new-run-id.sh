#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <repo-name> <platform> [attempt]" >&2
  exit 1
fi

repo="$1"
platform="$2"
attempt="${3:-01}"

echo "${repo}-${platform}-attempt-${attempt}"
