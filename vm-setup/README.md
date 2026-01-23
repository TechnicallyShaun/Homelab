# VM Setup

Scripts for quickly provisioning a new development VM with AI CLI tools.

## Usage

```bash
# 1. Install dev tools (Go, GitHub CLI, tmux, git config)
./install-dev-tools.sh

# 2. Install AI CLI tools (Claude, Gemini, Copilot, Codex)
./install-cli-ais.sh

# 3. Set up bash aliases and MOTD
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
