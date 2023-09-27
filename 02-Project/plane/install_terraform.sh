#!/bin/bash

# Update the package list and install required dependencies
sudo apt update
sudo apt install -y software-properties-common

# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the HashiCorp official repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

# Update the package list again to include the HashiCorp repository
sudo apt update

# Install Terraform
sudo apt install terraform

# Check Terraform version
terraform --version

echo "Terraform has been successfully installed."
