#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "$SCRIPT_DIR/rivals.json" /home/nemesis/.var/app/org.vinegarhq.Sober/data/sober/exe/ClientSettings/ClientAppSettings.json
