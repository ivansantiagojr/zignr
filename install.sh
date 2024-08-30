#!/bin/bash

binary_url="https://github.com/ivansantiagojr/zignr/releases/download/v0.1.1/binary-0.1.1-x86_64-linux"
binary_name="zignr"

echo "Downloading zignr..."
wget -q "$binary_url" -O "$binary_name"

if [ $? -ne 0 ]; then
    echo "Failed to download zignr."
    exit 1
fi

echo "Making zignr executable..."
chmod +x "$binary_name"

echo "Moving zignr to ~/.local/bin..."
mv "$binary_name" "$HOME/.local/bin/$binary_name"

# Verify installation
if [ $? -eq 0 ]; then
    echo "zignr installed successfully!"
else
    echo "Failed to move zignr to ~/.local/bin. You might need sudo privileges."
    exit 1
fi

echo
echo "add ~/.local/bin to you PATH so you can run zignr from anywhere"
echo "then use run zignr"
