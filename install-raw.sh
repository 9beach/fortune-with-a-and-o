#!/bin/bash

# Fortune with A and O Remote Installation Script (ZIP version)

# Check for required tools
command -v curl >/dev/null 2>&1 || { echo >&2 "curl is not installed. Please install curl first."; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo >&2 "unzip is not installed. Please install unzip first."; exit 1; }

# Create temporary directory
TEMP_DIR=$(mktemp -d)
echo "Created temporary directory: $TEMP_DIR"

# Download ZIP file
echo "Downloading ZIP file..."
curl -L https://github.com/9beach/fortune-with-a-and-o/archive/refs/heads/main.zip -o "$TEMP_DIR/fortune-with-a-and-o.zip"

# Extract ZIP file
echo "Extracting ZIP file..."
unzip "$TEMP_DIR/fortune-with-a-and-o.zip" -d "$TEMP_DIR"

# Change to extracted directory
cd "$TEMP_DIR/fortune-with-a-and-o-main" || { echo "Failed to change directory"; exit 1; }

# Run installation script
echo "Running installation script..."
./install.sh

# Clean up after installation
cd - || exit
rm -rf "$TEMP_DIR"

echo "Fortune with A and O installation completed."
