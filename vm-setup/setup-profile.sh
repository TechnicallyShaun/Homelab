#!/bin/bash
# Setup bash profile with AI CLI aliases and custom MOTD
# Re-running this script will overwrite previous settings

set -e

PROFILE_MARKER="# >>> vm-setup-profile >>>"
PROFILE_END_MARKER="# <<< vm-setup-profile <<<"

echo "=========================================="
echo "Setting Up Bash Profile & MOTD"
echo "=========================================="

# Ask for MOTD title
echo ""
read -p "Enter a title for your MOTD (e.g., 'Dev VM', 'AI Workstation'): " MOTD_TITLE

if [ -z "$MOTD_TITLE" ]; then
    MOTD_TITLE="AI Development Environment"
fi

# Clean up legacy entries from old versions of this script
echo ""
echo "Cleaning up old entries..."
sed -i '/# Load AI CLI aliases/d' ~/.bashrc 2>/dev/null || true
sed -i '/\.bash_ai_aliases/d' ~/.bashrc 2>/dev/null || true
sed -i '/# Display custom MOTD/d' ~/.bashrc 2>/dev/null || true
sed -i '/cat ~\/.motd/d' ~/.bashrc 2>/dev/null || true
rm -f ~/.motd ~/.bash_ai_aliases 2>/dev/null || true

# Remove existing profile block if present
sed -i "/$PROFILE_MARKER/,/$PROFILE_END_MARKER/d" ~/.bashrc 2>/dev/null || true

# Create the profile block
echo ""
echo "Creating bash profile..."

cat >> ~/.bashrc << 'EOF'

# >>> vm-setup-profile >>>
# AI CLI Quick Commands (YOLO modes) - managed by vm-setup/setup-profile.sh

# Claude Code - dangerously skip permissions
alias ccyo='claude --dangerously-skip-permissions'

# GitHub Copilot CLI - allow all tools
alias coyo='gh copilot --allow-all-tools'

# Gemini CLI - yolo mode
alias ggyo='gemini --yolo'

# OpenAI Codex CLI - yolo mode
alias cxyo='codex --yolo'
# <<< vm-setup-profile <<<
EOF

echo "Profile block added to ~/.bashrc"

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
