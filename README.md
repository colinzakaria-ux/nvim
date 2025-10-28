💤 nvim – A Modern, Minimal‑ist Neovim Configuration

    TL;DR – Clone this repo into ~/.config/nvim (or symlink it) and run nvim +'Lazy sync' +'qa'. You’ll get a fast, feature‑rich editor powered by Lazy.nvim, LSP, Treesitter, Noice, and a clean statusline.

✨ Highlights
Category	Plugin	Why it’s great
Plugin manager	folke/lazy.nvim	Lightning‑fast lazy loading, declarative specs, automatic updates.
LSP & diagnostics	neovim/nvim-lspconfig + williamboman/mason.nvim + williamboman/mason-lspconfig.nvim	One‑click installation of language servers, linters, formatters; zero‑config defaults.
Completion	hrsh7th/nvim-cmp + L3MON4D3/LuaSnip + LSP/buffer/path sources	Context‑aware completions with snippet expansion.
File explorer	nvim-neo-tree/neo-tree.nvim	Sidebar file tree with Git status and icons.
Terminal	akinsho/toggleterm.nvim	Floating or persistent terminal toggled with a single keystroke.
Auto‑pairs	windwp/nvim-autopairs	Automatic insertion of matching brackets/quotes, integrated with nvim-cmp.
UI polish	folke/noice.nvim	Replaces the default command‑line, messages, and popup‑menu with a sleek UI (LSP progress, hover, signatures, etc.).
Statusline	nvim-lualine/lualine.nvim	Minimal, performant statusline with mode, branch, diff, file info, and a custom Zsh‑virtual‑env component.
Syntax & indentation	nvim-treesitter/nvim-treesitter + windwp/nvim-ts-autotag	Accurate syntax highlighting, smart indentation, automatic HTML/XML tag closing.
Key‑binding hints	folke/which-key.nvim	Pops up possible <leader> bindings after you press the leader key.
Colorscheme	folke/tokyonight.nvim	Dark, low‑contrast theme that works great with the UI plugins above.
AI assistance	github/copilot.vim	Inline AI suggestions (ghost text) with sensible defaults.

All plugins are lazy‑loaded (most on VeryLazy or on the relevant filetype/event) so Neovim starts in ≈ 30 ms on a typical laptop.
📦 Prerequisites
Requirement	Install (Arch/Endeavour OS)
Neovim ≥ 0.9	sudo pacman -S neovim
Git	sudo pacman -S git
Nerd Font (for icons)	Install any Nerd Font (e.g., JetBrainsMono Nerd Font) and set it in your terminal.
True‑color terminal	Most modern terminals (Kitty, Alacritty, iTerm2, etc.) work out of the box.

For other distributions replace pacman with your package manager (apt, dnf, …).
🚀 Installation
1️⃣ Backup any existing config (optional)

mv ~/.config/nvim{,.bak}

2️⃣ Clone the repository

git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/.config/nvim

    Alternative – keep the repo elsewhere and symlink it:

    git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/dotfiles/nvim
    ln -sfn ~/dotfiles/nvim ~/.config/nvim

3️⃣ Bootstrap the plugins

nvim +'Lazy sync' +'qa'

Lazy.nvim will download every plugin, run :TSUpdate for Treesitter parsers, and compile any native extensions. Subsequent launches of Neovim will be instantaneous.
⌨️ Usage & Keybindings

    The leader key is mapped to <Space>. All <leader> shortcuts below use the spacebar.

Mode	Shortcut	Action	Plugin
Normal	<leader>e	Toggle Neo‑tree file explorer	neo-tree.nvim
Normal	<C-\>	Toggle floating ToggleTerm terminal	toggleterm.nvim
Normal	<leader>ff	Find files (fuzzy picker)	built‑in vim.ui.select fallback
Normal	<leader>lg	Open LSP diagnostics list	nvim-lspconfig
Normal	K	Show hover documentation	nvim-lspconfig
Normal	gd	Go to definition	nvim-lspconfig
Normal	gr	Go to references	nvim-lspconfig
Normal	<leader>la	Code actions (quick‑fix)	nvim-lspconfig
Normal	<leader>lr	Rename symbol under cursor	nvim-lspconfig
Normal	<leader>ca	Trigger Copilot suggestion (accept with <Tab>)	copilot.vim
Normal	<leader>ss	Open Noice command line (live grep)	noice.nvim
Normal	<leader>tt	Toggle Noice UI (messages / cmdline)	noice.nvim
Normal	<leader>bb	Show buffer list (quick switch)	which-key.nvim (display)
Normal	<C-h> / <C-l>	Move focus left/right between splits	native
Normal	<C-j> / <C-k>	Move focus down/up between splits	native
Normal	<leader>sv	Vertical split	native
Normal	<leader>sh	Horizontal split	native
Normal	<leader>wq	Write & quit	native
Normal	<leader>qq	Quit without saving	native

Press <Space> (the leader) in normal mode and which‑key will pop up a transient window listing all the available bindings.
🛠️ Extending / Customising

All plugin specifications live in lua/plugins/. Each file returns a table consumed by Lazy.nvim, e.g.:

-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- LSP on‑attach, mason setup, etc.
    end,
  },
  -- …other plugins…
}

To add a new plugin

    Create lua/plugins/<name>.lua.
    Return a table with the plugin spec (follow the existing pattern).
    Run nvim +'Lazy sync' +'qa' to install it.

📜 License

This configuration is released under the MIT License – feel free to copy, remix, and use it in your own setups.
🤝 Contributing

    Fork the repository.
    Create a feature branch (git checkout -b feat/awesome‑thing).
    Make your changes (add plugins, tweak keymaps, improve docs).
    Run nvim +'Lazy sync' +'qa' to ensure everything builds.
    Submit a Pull Request with a clear description of what you changed and why.

Please keep the lazy‑loading philosophy: plugins should load only when needed (filetype, command, or VeryLazy event) to preserve the ultra‑fast startup time.
🎉 Ready to code?

# One‑liner for a fresh Arch/EndeavourOS machine
sudo pacman -S --needed --noconfirm git neovim
git clone --depth=1 https://github.com/colinzakaria-ux/nvim.git ~/.config/nvim
nvim +'Lazy sync' +'qa'

Enjoy a blazing‑fast, feature‑rich, and beautiful Neovim experience! 🚀

