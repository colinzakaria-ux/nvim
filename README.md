# 💤 nvim – A Modern, Minimalist Neovim Configuration

A fast, feature-rich Neovim setup built around **Lazy.nvim**. All plugins are lazy-loaded, so Neovim starts in **$\approx$ 30 ms** on a typical laptop.

---

## TL;DR

This configuration is designed for **Arch Linux** and derivatives.

```bash
# One-liner for a fresh Arch/EndeavourOS machine
sudo pacman -S --needed --noconfirm git neovim
git clone --depth=1 [https://github.com/colinzakaria-ux/nvim.git](https://github.com/colinzakaria-ux/nvim.git) ~/.config/nvim
nvim +'Lazy sync' +'qa'

The first launch bootstraps Lazy.nvim, downloads every plugin, and runs :TSUpdate. Subsequent launches are instantaneous.

✨ Highlights

| Category | Plugin(s) | Why it shines |
| :--- | :--- | :--- |
| **Plugin manager** | `folke/lazy.nvim` | Lightning-fast lazy loading, declarative specs, automatic updates. |
| **LSP & diagnostics** | `neovim/nvim-lspconfig`, `williamboman/mason.nvim`, `williamboman/mason-lspconfig.nvim` | One-click installation of language servers, linters, formatters; zero-config defaults. |
| **Completion** | `hrsh7th/nvim-cmp`, `hrsh7th/cmp-nvim-lsp`, `hrsh7th/cmp-buffer`, `hrsh7th/cmp-path`, `L3MON4D3/LuaSnip` | Context-aware completions with snippet expansion. |
| **File explorer** | `nvim-neo-tree/neo-tree.nvim` | Sidebar file tree with Git status and icons. |
| **Terminal** | `akinsho/toggleterm.nvim` | Floating or persistent terminal toggled with a single keystroke. |
| **Auto-pairs** | `windwp/nvim-autopairs` | Automatic insertion of matching brackets/quotes, integrated with nvim-cmp. |
| **UI polish** | `folke/noice.nvim` | Replaces the default command-line, messages, and popup-menu with a sleek UI (LSP progress, hover, signatures, etc.). |
| **Statusline** | `nvim-lualine/lualine.nvim` | Minimal, performant statusline with mode, branch, diff, file info, and a custom Zsh-virtual-env component. |
| **Syntax & indentation** | `nvim-treesitter/nvim-treesitter`, `windwp/nvim-ts-autotag` | Accurate syntax highlighting, smart indentation, automatic HTML/XML tag closing. |
| **Key-binding hints** | `folke/which-key.nvim` | Pops up possible `<leader>` bindings after you press the leader key. |
| **Colorscheme** | `folke/tokyonight.nvim` | Dark, low-contrast theme that works great with the UI plugins above. |
| **AI assistance** | `github/copilot.vim` | Inline AI suggestions (ghost text) with sensible defaults. |

All plugins are lazy-loaded (most on VeryLazy or on the relevant filetype/event).

📦 Prerequisites

| Requirement | Install (Arch/Endeavour OS) |
| :--- | :--- |
| **Neovim $\ge$ 0.9** | `sudo pacman -S neovim` |
| **Git** | `sudo pacman -S git` |
| **Nerd Font (for icons)** | Install any Nerd Font (e.g., **JetBrainsMono Nerd Font**) and set it in your terminal emulator. |
| **True-color terminal** | Most modern terminals (Kitty, Alacritty, iTerm2, …) work out of the box. |

For other distros replace pacman with apt, dnf, or your favorite package manager.

🚀 Installation

    Backup any existing config (optional)
    Bash

mv ~/.config/nvim{,.bak}

Clone the repository
Bash

git clone --depth=1 [https://github.com/colinzakaria-ux/nvim.git](https://github.com/colinzakaria-ux/nvim.git) ~/.config/nvim

Alternative – keep the repo elsewhere and symlink it:
Bash

git clone --depth=1 [https://github.com/colinzakaria-ux/nvim.git](https://github.com/colinzakaria-ux/nvim.git) ~/dotfiles/nvim
ln -sfn ~/dotfiles/nvim ~/.config/nvim

Bootstrap the plugins
Bash

    nvim +'Lazy sync' +'qa'

The first launch will download every plugin, run :TSUpdate for Treesitter parsers, and compile any native extensions. After this run, Neovim starts instantly.

⌨️ Usage & Keybindings

Leader key: <Space> (all <leader> shortcuts below use the spacebar).

Press <Space> in normal mode, and which-key will pop up a transient window listing all the available bindings.

Basic File Operations (Normal Mode)

| Command | Action |
| :--- | :--- |
| :w | Write (save) the current file |
| :wq | Write the file and quit Neovim |
| :x | Save (if modified) and quit |
| :q | Quit the current window/split |
| :q! | Quit without saving changes |

Window & Split Management (Normal Mode)

| Keybinding | Action |
| :--- | :--- |
| <leader>sv | Split Vertically |
| <leader>sh | Split Horizontally |
| <C-h> / <C-l> | Move focus left/right between splits |
| <C-j> / <C-k> | Move focus down/up between splits |
| <C-Up> / <C-Down> | Increase/Decrease split height |
| <C-Left> / <C-Right> | Increase/Decrease split width |

Plugin Keybindings (Normal Mode)

| Keybinding | Action | Plugin |
| :--- | :--- | :--- |
| <leader>e | Toggle file explorer | neo-tree.nvim |
| <C-\> | Toggle floating terminal | toggleterm.nvim |
| <leader>ff | Find Files | telescope.nvim |
| <leader>fg | Find text via live grep | telescope.nvim |
| <leader>ca | ChatGPT Ask (opens prompt) | ChatGPT.nvim |
| K | Show hover documentation | nvim-lspconfig |
| gd | Go to Definition | nvim-lspconfig |
| gr | Go to References | nvim-lspconfig |
| <leader>la | Show LSP Actions | nvim-lspconfig |
| <leader>lr | LSP Rename symbol | nvim-lspconfig |
| <leader>co | Toggle Copilot on/off | copilot.vim |
| <leader>bb | Show buffer list (quick switch) | which-key.nvim |
| <Esc> | Dismiss Noice popup / clear hlsearch | noice.nvim |

🛠️ Extending / Customising

All plugin specifications live in lua/plugins/. Each file returns a table that Lazy.nvim consumes, e.g.:
Lua

-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- LSP on-attach, Mason setup, etc.
    end,
  },
  -- …other plugins…
}

Adding a new plugin

    Create lua/plugins/<name>.lua.

    Return a table with the plugin spec (follow the existing pattern).

    Run nvim +'Lazy sync' +'qa' to install it.

📜 License

This configuration is released under the MIT License – feel free to copy, remix, and use it in your own setups.

🤝 Contributing

    Fork the repository.

    Create a feature branch (git checkout -b feat/awesome-thing).

    Make your changes (add plugins, tweak keymaps, improve docs).

    Run nvim +'Lazy sync' +'qa' to ensure everything builds.

    Submit a Pull Request with a clear description of what you changed and why.

Guideline: Keep the lazy-loading philosophy – plugins should load only when needed (filetype, command, or VeryLazy event) to preserve the ultra-fast startup time.

🎉 Ready to code?

Bash

# Fresh Arch/EndeavourOS machine
sudo pacman -S --needed --noconfirm git neovim
git clone --depth=1 [https://github.com/colinzakaria-ux/nvim.git](https://github.com/colinzakaria-ux/nvim.git) ~/.config/nvim
nvim +'Lazy sync' +'qa'

Enjoy a blazing-fast, feature-rich, and beautiful Neovim experience! 🚀
