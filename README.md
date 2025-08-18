# My Neovim Configuration 🌙

This repository contains my personal configuration for Neovim, built around `lazy.nvim` for fast and declarative plugin management. It is designed to be a modern, lightweight, and powerful environment for software development.

---

## ✨ Core Features & Plugins

This setup is built on a collection of modern, high-performance plugins. Here are the key features:

* **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) for lightning-fast startup times and easy management.
* **LSP & Completion:**
    * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for language server configuration.
    * [mason.nvim](https://github.com/williamboman/mason.nvim) to easily manage LSP servers, linters, and formatters.
    * [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for powerful autocompletion, with sources for buffers, paths, and LSP.
    * [LuaSnip](https://github.com/L3MON4D3/LuaSnip) for snippet expansion.
* **File Navigation & Fuzzy Finding:**
    * [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) for a fast and modern file explorer.
    * [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for finding files, buffers, and text with a beautiful UI.
* **UI & Aesthetics:**
    * **Colorscheme:** [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for a clean, dark theme.
    * **Icons:** [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) for file and UI icons.
    * **Key Hints:** [which-key.nvim](https://github.com/folke/which-key.nvim) displays available keybindings after pressing the leader key.
* **Utilities & Quality of Life:**
    * **AI Assistant:** [ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim) for interacting with OpenAI models directly in the editor.
    * **Terminal:** [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) for easily managing floating/persistent terminals.
    * **Auto Closing:** [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for automatic closing of brackets, quotes, etc.

---

## 📋 Prerequisites

To use this configuration, you will need:
* [Neovim](https://neovim.io/) (v0.9.0 or newer is recommended).
* `git` for cloning and plugin management.
* A [Nerd Font](https://www.nerdfonts.com/) installed and enabled in your terminal for icons to render correctly.

---

## 🚀 Installation

1.  **Backup your existing Neovim configuration (if you have one):**
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2.  **Clone this repository into your `~/.config` directory:**
    ```bash
    git clone [https://github.com/](https://github.com/)[your-username]/[your-repo-name].git ~/.config/nvim
    ```
    *(Remember to replace `[your-username]` and `[your-repo-name]` with your actual details!)*

3.  **Launch Neovim:**
    ```bash
    nvim
    ```
    The first time you launch Neovim, `lazy.nvim` will automatically bootstrap itself and install all the plugins.

---

## ⌨️ Usage and Keybindings

**Leader Key:** The leader key is mapped to `Space`. All `<leader>` keymaps below use the **Spacebar**.

### Basic File Operations (Normal Mode)

| Command | Action                                           |
| :------ | :----------------------------------------------- |
| `:w`    | **W**rite (save) the current file.               |
| `:wq`   | **W**rite the file and **q**uit Neovim.          |
| `:x`    | Save the file (only if modified) and quit.       |
| `:q`    | **Q**uit the current window/split.               |
| `:q!`   | **Q**uit without saving changes.                 |

### Window & Split Management (Normal Mode)

| Keybinding          | Action                        |
| :------------------ | :---------------------------- |
| `<leader>sv`        | **S**plit **V**ertically.     |
| `<leader>sh`        | **S**plit **H**orizontally.   |
| `<C-h>` / `<C-l>`   | Move to the split left/right. |
| `<C-j>` / `<C-k>`   | Move to the split below/above.|
| `<C-Up>`/`<C-Down>` | Increase/Decrease height.     |
| `<C-Left>`/`<C-Right>`| Increase/Decrease width.      |

### Plugin Keybindings (Normal Mode)

| Keybinding     | Action                                         | Plugin          |
| :------------- | :--------------------------------------------- | :-------------- |
| `<leader>e`    | Toggle file **e**xplorer.                      | neo-tree.nvim   |
| `<C-/>`        | Toggle floating **t**erminal.                  | toggleterm.nvim |
| `<leader>ff`   | **F**ind **F**iles in the project.             | telescope.nvim  |
| `<leader>fg`   | **F**ind text via live **g**rep.               | telescope.nvim  |
| `<leader>ca`   | **C**hatGPT **A**sk (opens prompt).            | ChatGPT.nvim    |
| `K`            | Show hover documentation for item under cursor.| nvim-lspconfig  |
| `gd`           | **G**o to **D**efinition.                      | nvim-lspconfig  |
| `gr`           | **G**o to **R**eferences.                      | nvim-lspconfig  |
| `<leader>la`   | Show **L**SP Code **A**ctions.                 | nvim-lspconfig  |
| `<leader>lr`   | **L**SP **R**ename symbol.                     | nvim-lspconfig  |
 nvim-config
