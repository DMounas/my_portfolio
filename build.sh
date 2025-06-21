#!/bin/bash
set -e

# --- Install Flutter and dependencies ---
git clone https://github.com/flutter/flutter.git --depth 1
./flutter/bin/flutter --version
./flutter/bin/flutter pub get

# --- Build the project ---
./flutter/bin/flutter build web --release