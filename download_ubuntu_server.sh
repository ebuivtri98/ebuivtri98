#!/bin/bash

# URL for the Ubuntu Server 20.04 ISO image
ISO_URL="http://releases.ubuntu.com/20.04/ubuntu-20.04.6-live-server-amd64.iso"

# Destination path where the ISO will be saved
DESTINATION_PATH="/workspaces/ebuivtri98/ubuntu-20.04.6-live-server-amd64.iso"

# Download the ISO image using wget
wget -c "$ISO_URL" -O "$DESTINATION_PATH"

# Verify the integrity of the downloaded ISO (optional)
# You'll need the SHA256SUMS and SHA256SUMS.gpg files from the same Ubuntu release directory
# For example: http://releases.ubuntu.com/20.04/SHA256SUMS and http://releases.ubuntu.com/20.04/SHA256SUMS.gpg
# gpg --keyserver keyserver.ubuntu.com --recv-keys 0xFBB75451
# gpg --verify SHA256SUMS.gpg SHA256SUMS
# sha256sum -c --ignore-missing SHA256SUMS 2>/dev/null

# Check if the download was successful
if [ $? -eq 0 ]; then
  echo "Ubuntu Server 20.04 ISO download complete."
else
  echo "Download failed. Please check the URL and try again."
fi
