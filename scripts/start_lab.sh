#!/usr/bin/env bash
set -euo pipefail
echo "[+] Starting/refreshing dummy containers..."
docker rm -f web1 web2 >/dev/null 2>&1 || true
docker run -d --name web1 --hostname web1 ubuntu:22.04 sleep infinity
docker run -d --name web2 --hostname web2 ubuntu:22.04 sleep infinity
if [[ "${INSTALL_PYTHON_IN_CONTAINERS:-0}" == "1" ]]; then
  echo "[+] Installing python3 inside containers (optional)..."
  docker exec -it web1 bash -lc "apt-get update && apt-get install -y python3"
  docker exec -it web2 bash -lc "apt-get update && apt-get install -y python3"
fi
echo "[+] Containers:"
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
echo "[+] Done."
