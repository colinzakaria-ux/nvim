-- ~/.config/nvim/init.lua

-- Set leader key to space
-- MUST be before plugins are loaded
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

-- Essential editor options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse support in all modes
vim.opt.ignorecase = true     -- Case-insensitive searching
vim.opt.smartcase = true      -- But case-sensitive if you type an uppercase letter
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Show search results as you type
vim.opt.tabstop = 2           -- Tabs are 2 spaces
vim.opt.softtabstop = 2       -- ...
vim.opt.shiftwidth = 2        -- ...
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.wrap = false          -- Do not wrap lines
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wall" })
