#!/bin/bash

#Author - Yhemar
#Description - This is a script for jenkins installation on ubuntu server
#Date - 25/10/2024

# Script to install Jenkins on Ubuntu

# Step 1: Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install Java (Jenkins requires Jav a)
echo "Installing Java (OpenJDK 11)..."
sudo apt install -y openjdk-11-jdk

# Step 3: Add Jenkins repository
echo "Adding Jenkins repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 4: Update package list to include Jenkins
echo "Updating package list..."
sudo apt update -y

# Step 5: Install Jenkins
echo "Installing Jenkins..."
sudo apt install -y jenkins

# Step 6: Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Step 7: Enable Jenkins to start on boot
echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

# Step 8: Open firewall port for Jenkins (default port 8080)
echo "Opening firewall port 8080 for Jenkins..."
sudo ufw allow 8080
sudo ufw reload

# Step 9: Print the initial admin password
echo "Fetching the initial Jenkins admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins installation is complete!"
echo "You can access Jenkins at: http://your_server_ip:8080"
