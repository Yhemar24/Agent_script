#!/bin/bash

#Author - Yhemar
#Description - Docker installation
#Date - 25/10/2024

# Script to install Docker on Ubuntu

# Step 1: Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install prerequisite s
echo "Installing prerequisites..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Step 3: Add Docker’s official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Step 4: Add Docker APT repository
echo "Adding Docker APT repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Update package list to include Docker packages
echo "Updating package list..."
sudo apt update -y

# Step 6: Install Docker
echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Step 7: Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Step 8: Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# Step 9: Add current user to the Docker group (optional)
echo "Adding current user to Docker group (optional)..."
sudo usermod -aG docker $USER

echo "Docker installation is complete!"
echo "You may need to log out and log back in to apply the Docker group permissions."
echo "Verify Docker installation by running: docker --version"
