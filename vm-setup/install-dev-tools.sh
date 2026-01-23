#!/bin/bash
# Install Development Tools: Go, GitHub CLI, tmux, and Git config

set -e

echo "=========================================="
echo "Installing Development Tools"
echo "=========================================="

# Git config
echo ""
echo "[1/4] Configuring Git..."
git config --global user.name "Shaun"
git config --global user.email "me@technicallyshaun.com"
echo "Git configured: Shaun <me@technicallyshaun.com>"

# tmux
echo ""
echo "[2/4] Installing/updating tmux..."
sudo apt update -qq
sudo apt install -y tmux
echo "tmux installed: $(tmux -V)"

# Go
echo ""
echo "[3/4] Installing Go..."
if command -v go &> /dev/null; then
    echo "Go already installed: $(go version)"
else
    GO_VERSION="1.22.0"
    wget -q "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" -O /tmp/go.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf /tmp/go.tar.gz
    rm /tmp/go.tar.gz

    # Add to PATH if not already there
    if ! grep -q '/usr/local/go/bin' ~/.bashrc; then
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    fi
    export PATH=$PATH:/usr/local/go/bin
    echo "Go installed successfully: $(go version)"
fi

# GitHub CLI
echo ""
echo "[4/4] Installing GitHub CLI..."
if command -v gh &> /dev/null; then
    echo "GitHub CLI already installed: $(gh --version | head -1)"
else
    # Install GitHub CLI via official repo
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh -y
    echo "GitHub CLI installed successfully"
fi

echo ""
echo "=========================================="
echo "Development Tools Installation Complete!"
echo "=========================================="
echo ""
echo "Configured/Installed:"
echo "  - git (configured as Shaun <me@technicallyshaun.com>)"
echo "  - tmux (terminal multiplexer)"
echo "  - go (Go programming language)"
echo "  - gh (GitHub CLI)"
echo ""
echo "Note: You may need to restart your shell or run 'source ~/.bashrc' for PATH changes to take effect."
echo ""
