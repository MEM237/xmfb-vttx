# XMFB Flutter Surface

**Mobile implementation of the XMFB Protocol — Extensible Mirrored Feedback Bridge**

This Flutter app represents the mobile UI surface of the **XMFB Surface Pack**, a multi-platform symbolic trust protocol system. It interprets agent presence, renders symbolic identity states, and lays groundwork for live reflex loop validation on mobile devices.

---

## 🧠 About XMFB

XMFB is a symbolic protocol for presence-authenticated interaction.  
It replaces traditional authentication methods with:

- `%smash-tag` → Session-bound message identity signature  
- `::μ~zen` → Reflex validation via mutual presence

---

## 📱 App Features (v0.6 Pre-release)

- Symbolic grid of agents, matching core protocol spec  
- Icons + color-coded state rendering  
- `%smash-tag` generated per session  
- Prewired for reflex loop simulation  
- Shared visual language with web and CLI surfaces  

---

## 📦 Structure


lib/
├── models/ # Agent and state models
├── providers/ # Theme + state providers
├── screens/ # Splash + Reflex main screen
├── theme/ # App-wide symbolic style

---

## 🚀 Running the App

To run locally:



Tested on:
- Android Emulator (Pixel 5 API 31)
- iOS Simulator (iPhone 13)
- Flutter Web (Chrome)

---

## 🔗 Related Surfaces

This is part of the **XMFB Surface Pack** — view others:

| Surface        | Link |
|----------------|------|
| Web (React)    | [xmfb-vttx.web.app](https://xmfb-vttx.web.app) |
| CLI (Python)   | [xmfb-vttx repo](https://github.com/MEM237/xmfb-vttx/tree/main/cli) |
| Chrome Ext.    | [Escalator prototype](https://github.com/MEM237/xmfb-vttx/tree/main/chrome-extension) |

---

## 🛠️ Built With

- Flutter 3.x  
- Dart  
- Provider  
- Firebase (planned integration)  

---

> “XMFB doesn’t just authenticate — it reflects.”

---

## 📄 License

MIT
