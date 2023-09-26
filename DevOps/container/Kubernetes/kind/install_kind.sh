#!/bin/bash

# Check if Docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo "Docker is not installed. Please install Docker before proceeding."
  exit 1
fi

# Install Go (KinD is written in Go)
if ! [ -x "$(command -v go)" ]; then
  echo "Go is not installed. Installing Go..."
  sudo apt update
  sudo apt install -y golang
fi

# Install KinD
echo "Installing KinD..."
GO111MODULE="on" go install sigs.k8s.io/kind@v0.20.0

# Move KinD binary to /usr/local/bin
sudo mv $HOME/go/bin/kind /usr/local/bin

# Verify the installation
kind version

echo "KinD installation completed."
