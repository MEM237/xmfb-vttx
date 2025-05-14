# XMFB Protocol: Surface Pack

**One protocol. Many faces. Presence is the password.**

XMFB (Extensible Mirrored Feedback Bridge) is a symbolic protocol for presence-authenticated communication. It replaces login-centric identity with reflexive, mirrored trust logic.

This repository is the reference implementation of the **XMFB Surface Pack**, a cross-platform demonstration suite including:

- 🌐 **Web (React/Vite)** — Reflex Grid UI with symbolic state icons and `%smash-tag`
- 📱 **Mobile (Flutter)** — Reflex Terminal (in development)
- 🖥️ **CLI (Python)** — Smash-tag generator and reflex loop simulator
- 🧩 **Chrome Extension** — Escalator prototype (presence-based chat interaction)

---

## 🔗 Live Demo

🟢 **[XMFB Web Reflex Grid (Firebase)](https://xmfb-vttx.web.app)**  
→ View symbolic presence states, `%smash-tag`s, and the Reflex Grid in action

---

## 📂 Repo Structure

\`\`\`
xmfb-vttx/
├── public/assets/icons/        # Symbolic icon set (PNG)
├── src/components/             # React components (AgentCell, ReflexGrid)
├── src/data/mockAgents.json    # Agent presence state examples
├── src/utils/                  # %smash-tag + state logic
├── cli/                        # Python reflex agent
├── chrome-extension/           # Escalator prototype (browser surface)
├── docs/protocol/xmfb_core.md # Protocol reference
├── xmfb_flutter_app/           # Mobile UI (Flutter surface)
\`\`\`

---

## 🔐 Protocol Overview

See [docs/protocol/xmfb_core.md](docs/protocol/xmfb_core.md) for a detailed specification.

Key features:
- `%smash-tag`: identity signature bound to presence + session
- `::μ~zen`: reflex validation loop — mutual visibility condition
- Symbolic state matrix: 7 distinct presence states tied to icons

---

## 🛠️ Built With

- React + Vite
- TailwindCSS
- Firebase Hosting
- Python 3.x (CLI)
- Flutter (Mobile)
- Chrome Extension (Manifest v3)

---

## 📽️ Demo Video (coming soon...)

> “XMFB doesn’t just authenticate — it reflects.”
