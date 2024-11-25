#!/bin/bash

echo "Checking for Docker installation..."

if ! [ -x "$(command -v docker)" ]; then
    echo "Docker is not installed. Proceeding with installation..."
    
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo "Unable to detect OS distribution. Exiting."
        exit 1
    fi

    case "$DISTRO" in
        ubuntu|debian)
            echo "Installing Docker on Ubuntu/Debian..."
            sudo apt-get update
            sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            sudo apt-get update
            sudo apt-get install -y docker-ce docker-ce-cli containerd.io
            ;;
        
        fedora|rhel|centos)
            echo "Installing Docker on Fedora/RHEL/CentOS..."
            sudo dnf install -y moby-engine
            sudo systemctl enable docker
            sudo systemctl start docker
            ;;
        
        *)
            echo "Unsupported distribution: $DISTRO. Please install Docker manually."
            exit 1
            ;;
    esac

    if [ -x "$(command -v docker)" ]; then
        echo "Docker installed successfully!"
    else
        echo "Docker installation failed. Please check your system setup."
        exit 1
    fi
else
    echo "Docker is already installed!"
fi

echo "Adding the current user to the Docker group (may require a re-login)..."
sudo usermod -aG docker $USER

echo "Docker setup completed! You may need to log out and log back in for group changes to take effect."
