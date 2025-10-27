-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Command to run after installation
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",   -- Provides the `autotag` module used below
  },
  config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup({
      -- Specify the parsers you want to install.
      -- Lazy.nvim will run the `build = ":TSUpdate"` command to install these.
      ensure_installed = {
        "lua",
        "vim",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true, -- Enable syntax highlighting
      },
      indent = {
        enable = true, -- Enable automatic indentation
      },
      autotag = {
        enable = true, -- Auto-close/rename HTML tags (requires windwp/nvim-ts-autotag)
      },
    })
  end,
}
