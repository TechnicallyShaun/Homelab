<h1 align="center">🖥️ VM Setup</h1>
<p align="center">Scripts for quickly provisioning a new development VM with AI CLI tools</p>

---

## Run Remotely

```bash
# 1. Install dev tools (Go, GitHub CLI, tmux, git config)
curl -fsSL https://raw.githubusercontent.com/TechnicallyShaun/Homelab/main/vm-setup/install-dev-tools.sh -o /tmp/install-dev-tools.sh && bash /tmp/install-dev-tools.sh

# 2. Install AI CLI tools (Claude, Gemini, Copilot, Codex)
curl -fsSL https://raw.githubusercontent.com/TechnicallyShaun/Homelab/main/vm-setup/install-cli-ais.sh | bash

# 3. Set up bash aliases and MOTD
curl -fsSL https://raw.githubusercontent.com/TechnicallyShaun/Homelab/main/vm-setup/setup-profile.sh -o /tmp/setup-profile.sh && bash /tmp/setup-profile.sh

# Re-run/fix profile setup (cleans up old MOTD files first)
sudo rm -f /etc/motd /etc/motd.tail /run/motd.dynamic && curl -fsSL https://raw.githubusercontent.com/TechnicallyShaun/Homelab/main/vm-setup/setup-profile.sh -o /tmp/setup-profile.sh && bash /tmp/setup-profile.sh
```

## Run Locally

```bash
git clone git@github.com:TechnicallyShaun/Homelab.git
cd Homelab/vm-setup
./install-dev-tools.sh
./install-cli-ais.sh
./setup-profile.sh
```

---

## ⚡ YOLO Mode Aliases

After running `setup-profile.sh`:

| Alias | Command |
|:------|:--------|
| `ccyo` | `claude --dangerously-skip-permissions` |
| `coyo` | `gh copilot --allow-all-tools` |
| `ggyo` | `gemini --yolo` |
| `cxyo` | `codex --yolo` |
