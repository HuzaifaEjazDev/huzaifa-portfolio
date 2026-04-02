#!/bin/bash

# Clone Flutter
git clone https://github.com/flutter/flutter.git -b stable

# Add Flutter to PATH
export PATH="$PWD/flutter/bin:$PATH"

# Enable web support
flutter config --enable-web

# Get dependencies
flutter pub get

# Build web release
flutter build web --release