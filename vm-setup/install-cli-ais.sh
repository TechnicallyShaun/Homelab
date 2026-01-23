#!/bin/bash
# Install CLI AI Tools: Claude CLI, Gemini CLI, Copilot CLI, Codex CLI

set -e

echo "=========================================="
echo "Installing CLI AI Tools"
echo "=========================================="

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "npm not found. Installing Node.js and npm..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Claude CLI
echo ""
echo "[1/4] Installing Claude CLI..."
if command -v claude &> /dev/null; then
    echo "Claude CLI already installed"
else
    npm install -g @anthropic-ai/claude-code
    echo "Claude CLI installed successfully"
fi

# Gemini CLI
echo ""
echo "[2/4] Installing Gemini CLI..."
if command -v gemini &> /dev/null; then
    echo "Gemini CLI already installed"
else
    npm install -g @anthropic-ai/gemini-cli 2>/dev/null || npm install -g @anthropic-ai/gemini-cli
    # Alternative: npm install -g gemini-cli
    npm install -g @anthropic-ai/gemini-cli 2>/dev/null || npm install -g gemini-cli
    echo "Gemini CLI installed successfully"
fi

# Copilot CLI
echo ""
echo "[3/4] Installing Copilot CLI..."
if command -v copilot &> /dev/null; then
    echo "Copilot CLI already installed"
else
    # GitHub Copilot CLI requires GitHub CLI extension
    if ! command -v gh &> /dev/null; then
        echo "GitHub CLI required for Copilot CLI. Please run install-dev-tools.sh first."
    else
        gh extension install github/gh-copilot 2>/dev/null || echo "Copilot extension may already be installed"
        echo "Copilot CLI installed as gh copilot"
    fi
fi

# Codex CLI
echo ""
echo "[4/4] Installing Codex CLI..."
if command -v codex &> /dev/null; then
    echo "Codex CLI already installed"
else
    npm install -g @openai/codex
    echo "Codex CLI installed successfully"
fi

echo ""
echo "=========================================="
echo "CLI AI Tools Installation Complete!"
echo "=========================================="
echo ""
echo "Installed tools:"
echo "  - claude (Anthropic Claude Code)"
echo "  - gemini (Google Gemini CLI)"
echo "  - gh copilot (GitHub Copilot CLI)"
echo "  - codex (OpenAI Codex CLI)"
echo ""
