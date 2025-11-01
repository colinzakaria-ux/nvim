-- ~/dotfiles/nvim/init.lua

-- === Core Setup ===

-- Set leader key to space (MUST be before plugins are loaded)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Tell lazy.nvim to load all files from our `lua/plugins/` directory
require("lazy").setup("plugins")


-- === General Editor Options ===

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse support in all modes
vim.opt.ignorecase = true     -- Case-insensitive searching
vim.opt.smartcase = true      -- Case-sensitive if you type an uppercase letter
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Show search results as you type
vim.opt.wrap = false          -- Do not wrap lines
vim.opt.signcolumn = 'yes'    -- Always show the sign column

-- === Tab/Indent Options ===

vim.opt.tabstop = 2           -- Tabs are 2 spaces
vim.opt.softtabstop = 2       -- Number of spaces a <Tab> counts for at the start of a line
vim.opt.shiftwidth = 2        -- Size of an indent
vim.opt.expandtab = true      -- Use spaces instead of tabs

-- === Spell Check Configuration ===
-- Turns on the built-in spell checker
vim.opt.spell = true
-- Set language to US English. Assumes you have hunspell_en dictionaries installed
vim.opt.spelllang = 'en_us'
-- Optional: If you want a personal wordlist, you can set a path here
-- vim.opt.spellfile = '~/.config/nvim/spell/en.utf-8.add'


-- === Autocmds and Keymaps ===

-- Auto-save on focus lost
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wall" })

-- Keymap to quickly toggle spell check on/off
vim.api.nvim_set_keymap('n', '<leader>ss', ':setlocal spell!<CR>', { noremap = true, silent = true, desc = "Toggle Spell Check" })
