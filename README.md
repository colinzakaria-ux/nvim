Certainly, here is the complete, final `README.md` file, incorporating all the plugin details, keybindings, and the foundational settings confirmed by your `init.lua`.

-----

# 💤 nvim – A Modern, Minimalist Neovim Configuration

A fast, feature-rich Neovim setup built around **Lazy.nvim**. All plugins are lazy-loaded, so Neovim starts in **$\approx$ 30 ms** on a typical laptop.

-----

## TL;DR

This configuration is designed for **Arch Linux** and derivatives.

```bash
# One-liner for a fresh Arch/EndeavourOS machine
sudo pacman -S --needed --noconfirm git neovim
git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/.config/nvim
nvim +'Lazy sync' +'qa'
```

The first launch bootstraps Lazy.nvim, downloads every plugin, and runs `:TSUpdate`. Subsequent launches are instantaneous.

-----

## ✨ Highlights

The configuration loads plugins from the `lua/plugins/` directory.

```
| Category | Plugin(s) | Why it shines |
| :--- | :--- | :--- |
| **Plugin manager** | `folke/lazy.nvim` | Lightning-fast lazy loading, declarative specs, automatic updates. |
| **LSP & Manager** | `neovim/nvim-lspconfig`, `williamboman/mason.nvim` | One-click installation of language servers and zero-config defaults. |
| **Completion** | `hrsh7th/nvim-cmp`, `L3MON4D3/LuaSnip` | Context-aware completions with snippet expansion, prioritizing LSP. |
| **File explorer** | `nvim-neo-tree/neo-tree.nvim` | Sidebar file tree with Git status and icons. |
| **Terminal** | `akinsho/toggleterm.nvim` | Floating or persistent terminal toggled with a single keystroke (`<C-\>`). |
| **Auto-pairs** | `windwp/nvim-autopairs` | Automatic insertion of matching brackets/quotes, integrates with nvim-cmp. |
| **UI polish** | `folke/noice.nvim` | Replaces the default command-line, messages, and popups with a sleek UI. |
| **Statusline** | `nvim-lualine/lualine.nvim` | Minimal, performant statusline with mode, branch, diff, file info, and optional Zsh-virtual-env component. |
| **Syntax & Tags** | `nvim-treesitter/nvim-treesitter`, `windwp/nvim-ts-autotag` | Accurate syntax highlighting, smart indentation, automatic HTML/XML tag closing. |
| **Key-binding hints** | `folke/which-key.nvim` | Pops up possible `<leader>` bindings after you press the leader key. |
| **Colorscheme** | `folke/tokyonight.nvim` | Dark, low-contrast theme loaded with high priority. |
| **AI assistance** | `github/copilot.vim`, `jackMort/ChatGPT.nvim` | Inline AI suggestions (ghost text) and dedicated GPT commands. |
```

All plugins are lazy-loaded (most on `VeryLazy` or on the relevant filetype/event).

-----

## 📦 Prerequisites

```
| Requirement | Install (Arch/Endeavour OS) |
| :--- | :--- |
| **Neovim $\ge$ 0.9** | `sudo pacman -S neovim` |
| **Git** | `sudo pacman -S git` |
| **Nerd Font (for icons)** | Install any Nerd Font (e.g., **JetBrainsMono Nerd Font**) and set it in your terminal emulator. |
| **True-color terminal** | Most modern terminals (Kitty, Alacritty, iTerm2, …) work out of the box. |
```

For other distros replace `pacman` with `apt`, `dnf`, or your favorite package manager.

-----

## 🚀 Installation

1.  **Backup any existing config (optional)**

    ```bash
    mv ~/.config/nvim{,.bak}
    ```

2.  **Clone the repository**

    ```bash
    git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/.config/nvim
    ```

    *Alternative – keep the repo elsewhere and symlink it:*

    ```bash
    git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/dotfiles/nvim
    ln -sfn ~/dotfiles/nvim ~/.config/nvim
    ```

3.  **Bootstrap the plugins**

    ```bash
    nvim +'Lazy sync' +'qa'
    ```

The first launch will download every plugin, run `:TSUpdate` for Treesitter parsers, and compile any native extensions. After this run, Neovim starts instantly.

-----

## ⌨️ Usage & Keybindings

**Leader key:** `<Space>` (all `<leader>` shortcuts below use the spacebar).

Press `<Space>` in normal mode, and **which-key** will pop up a transient window listing all the available bindings.

### Basic File Operations (Normal Mode)

```
| Command | Action |
| :--- | :--- |
| :w | Write (save) the current file |
| :wq | Write the file and quit Neovim |
| :x | Save (if modified) and quit |
| :q | Quit the current window/split |
| :q! | Quit without saving changes |
```

### Window & Split Management (Normal Mode)

```
| Keybinding | Action |
| :--- | :--- |
| <leader>sv | Split Vertically |
| <leader>sh | Split Horizontally |
| <C-h> / <C-l> | Move focus left/right between splits |
| <C-j> / <C-k> | Move focus down/up between splits |
| <C-Up> / <C-Down> | Increase/Decrease split height |
| <C-Left> / <C-Right> | Increase/Decrease split width |
```

### Plugin Keybindings (Normal Mode)

```
| Keybinding | Action | Plugin |
| :--- | :--- | :--- |
| <leader>e | Toggle file explorer | neo-tree.nvim |
| <C-\> | Toggle floating terminal | toggleterm.nvim |
| <leader>ca | ChatGPT Ask (opens prompt) | ChatGPT.nvim |
| <leader>co | Toggle Copilot service on/off | copilot.vim |
| K | Show hover documentation | nvim-lspconfig |
| gd | Go to Definition | nvim-lspconfig |
| gr | Go to References | nvim-lspconfig |
| <leader>la | Show LSP Code Actions | nvim-lspconfig |
| <leader>lr | LSP Rename symbol | nvim-lspconfig |
| <Esc> | Dismiss Noice popup / clear hlsearch | noice.nvim |
```

**Visual Mode (Selection):**

```
| Keybinding | Action | Plugin |
| :--- | :--- | :--- |
| <leader>ce | ChatGPT Edit with Instructions | ChatGPT.nvim |
```

-----

## 🛠️ Extending / Customising

All plugin specifications live in `lua/plugins/`. Lazy.nvim loads all files from this directory.

### Adding a new plugin

1.  Create `lua/plugins/<name>.lua`.
2.  Return a table with the plugin spec (follow the existing pattern).
3.  Run `nvim +'Lazy sync' +'qa'` to install it.

-----

## 📜 License

This configuration is released under the **MIT License** – feel free to copy, remix, and use it in your own setups.

-----

## 🤝 Contributing

1.  Fork the repository.
2.  Create a feature branch (`git checkout -b feat/awesome-thing`).
3.  Make your changes (add plugins, tweak keymaps, improve docs).
4.  Run `nvim +'Lazy sync' +'qa'` to ensure everything builds.
5.  Submit a Pull Request with a clear description of what you changed and why.

**Guideline:** Keep the lazy-loading philosophy – plugins should load only when needed (filetype, command, or `VeryLazy` event) to preserve the ultra-fast startup time.

-----

## 🎉 Ready to code?

```bash
# Fresh Arch/EndeavourOS machine
sudo pacman -S --needed --noconfirm git neovim
git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/.config/nvim
nvim +'Lazy sync' +'qa'
```

Enjoy a blazing-fast, feature-rich, and beautiful Neovim experience\! 🚀
