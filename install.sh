#!/bin/bash

APP_VERSION="0.2.0"
BASE_URL="https://github.com/brasilisclub/zignr/releases/download/v$APP_VERSION"

BINARY_URL_LINUX="$BASE_URL/BINARY-$APP_VERSION-X86_64-LINUX"
BINARY_URL_MACOS_ARM="$BASE_URL/BINARY-$APP_VERSION-AARCH64-MACOS"
BINARY_URL_MACOS="$BASE_URL/binary-$APP_VERSION-x86_64-macos"
APP_NAME="zignr"
OS_TYPE=$OSTYPE
CPU_TYPE=$CPUTYPE


download_and_create_executable() {
	echo "Downloading zignr..."
	wget -q "$binary_url" -O "$APP_NAME"

	if [ $? -ne 0 ]; then
    	echo "Failed to download zignr."
    	exit 1
	fi

	echo "Making zignr executable..."
	chmod +x "$APP_NAME"
}

linux_install () {
	echo "Moving zignr to ~/.local/bin..."
	mv "$APP_NAME" "$HOME/.local/bin/$APP_NAME"

	# Verify installation
	if [ $? -eq 0 ]; then
	    echo "zignr installed successfully!"
	else
	    echo "Failed to move zignr to ~/.local/bin. You might need sudo privileges."
	    exit 1
	fi

	echo
	echo "Add ~/.local/bin to you PATH so you can run zignr from anywhere"
	echo "Then use run zignr"
}

macos_install(){
	echo "Mac installation will be supported soon"
}

case "$OSTYPE" in
	linux-gnu)
		binary_url=$BINARY_URL_LINUX
		download_and_create_executable
		linux_install
		;;
	darwin)
		if [[ $CPU_TYPE == "x86_64" ]]; then
			binary_url=$BINARY_URL_MACOS
		fi
		binary_url=$BINARY_URL_MACOS_ARM
		download_and_create_executable
		macos_install
		;;
esac
