#!/bin/bash
set -e

# --- Set a specific, stable Flutter version ---
FLUTTER_VERSION="3.32.4"

# --- Install Flutter and dependencies ---
echo "Cloning Flutter SDK version $FLUTTER_VERSION..."
git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION --depth 1

# --- Set up the Flutter PATH ---
export PATH="$PWD/flutter/bin:$PATH"

# --- Verify Flutter installation ---
flutter --version

# --- Get project dependencies ---
echo "Running 'flutter pub get'..."
flutter pub get

# --- Build the project ---
echo "Running 'flutter build web --release'..."
flutter build web --release