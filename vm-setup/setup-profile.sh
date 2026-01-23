#!/bin/bash
# Setup bash profile with AI CLI aliases and custom MOTD

set -e

echo "=========================================="
echo "Setting Up Bash Profile & MOTD"
echo "=========================================="

# Ask for MOTD title
echo ""
read -p "Enter a title for your MOTD (e.g., 'Dev VM', 'AI Workstation'): " MOTD_TITLE

if [ -z "$MOTD_TITLE" ]; then
    MOTD_TITLE="AI Development Environment"
fi

# Create aliases file
echo ""
echo "Creating AI CLI aliases..."

ALIAS_FILE="$HOME/.bash_ai_aliases"

cat > "$ALIAS_FILE" << 'EOF'
# AI CLI Quick Commands (YOLO modes)
# These bypass permission checks - use responsibly!

# Claude Code - dangerously skip permissions
alias ccyo='claude --dangerously-skip-permissions'

# GitHub Copilot CLI - allow all tools
alias coyo='gh copilot --allow-all-tools'

# Gemini CLI - yolo mode
alias ggyo='gemini --yolo'

# OpenAI Codex CLI - yolo mode (bypass approvals and sandbox)
alias cxyo='codex --yolo'
EOF

# Add source to .bashrc if not already there
if ! grep -q '.bash_ai_aliases' ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Load AI CLI aliases" >> ~/.bashrc
    echo "[ -f ~/.bash_ai_aliases ] && source ~/.bash_ai_aliases" >> ~/.bashrc
    echo "Aliases added to ~/.bashrc"
else
    echo "Aliases already sourced in ~/.bashrc"
fi

# Create MOTD
echo ""
echo "Creating custom MOTD..."

MOTD_CONTENT=$(cat << EOF
================================================================================

    ${MOTD_TITLE}

================================================================================

  AI CLI Quick Commands (YOLO Mode):

    ccyo  - Claude Code      (--dangerously-skip-permissions)
    coyo  - GitHub Copilot   (--allow-all-tools)
    ggyo  - Gemini CLI       (--yolo)
    cxyo  - Codex CLI        (--yolo)

  WARNING: These commands bypass permission checks. Use responsibly!

================================================================================
EOF
)

# Write MOTD to /etc/motd (requires sudo)
echo "$MOTD_CONTENT" | sudo tee /etc/motd > /dev/null

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Aliases created:"
echo "  ccyo - claude --dangerously-skip-permissions"
echo "  coyo - gh copilot --allow-all-tools"
echo "  ggyo - gemini --yolo"
echo "  cxyo - codex --yolo"
echo ""
echo "MOTD has been set with title: $MOTD_TITLE"
echo ""
echo "Run 'source ~/.bashrc' or start a new terminal to use the aliases."
echo ""
