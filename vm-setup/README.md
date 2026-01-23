# VM Setup

Scripts for quickly provisioning a new development VM with AI CLI tools.

## Usage

### Run Remotely

```bash
BASE_URL="https://raw.githubusercontent.com/TechnicallyShaun/Homelab/main/vm-setup"

# 1. Install dev tools (Go, GitHub CLI, tmux, git config)
curl -fsSL "$BASE_URL/install-dev-tools.sh" -o /tmp/install-dev-tools.sh && bash /tmp/install-dev-tools.sh

# 2. Install AI CLI tools (Claude, Gemini, Copilot, Codex)
curl -fsSL "$BASE_URL/install-cli-ais.sh" | bash

# 3. Set up bash aliases and MOTD
curl -fsSL "$BASE_URL/setup-profile.sh" -o /tmp/setup-profile.sh && bash /tmp/setup-profile.sh
```

### Run Locally

```bash
git clone git@github.com:TechnicallyShaun/Homelab.git
cd Homelab/vm-setup
./install-dev-tools.sh
./install-cli-ais.sh
./setup-profile.sh
```

## YOLO Mode Aliases

After running `setup-profile.sh`:

| Alias | Command |
|-------|---------|
| `ccyo` | `claude --dangerously-skip-permissions` |
| `coyo` | `gh copilot --allow-all-tools` |
| `ggyo` | `gemini --yolo` |
| `cxyo` | `codex --yolo` |
