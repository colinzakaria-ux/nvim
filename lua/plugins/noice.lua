-- plugins/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },

  opts = {
    lsp = {
      progress  = { enabled = true },
      hover     = { enabled = true },
      signature = { enabled = true },
    },
    cmdline = {
      enabled = true,
      view    = "cmdline_popup",
    },
    messages = {
      enabled = true,
      view    = "mini",
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
    },
    routes = {
      {
        filter = { event = "msg_show", find = "written" },
        opts   = { skip = true },
      },
    },
  },

  config = function(_, opts)
    require("noice").setup(opts)

    -- Safe <Esc> mapping ----------------------------------------------------
    vim.keymap.set("n", "<Esc>", function()
      local ok, noice = pcall(require, "noice")
      if not ok or not noice then          -- Noice not loaded – just clear hlsearch
        vim.cmd("nohlsearch")
        return
      end

      -- `noice.status()` returns a table like:
      --   { cmdline = false, popupmenu = false, messages = false, ... }
      local status = noice.status()
      local any_popup = status.cmdline or status.popupmenu or status.messages or status.lsp

      if any_popup then
        -- Dismiss whatever Noice UI element is currently shown
        pcall(noice.dismiss)
      else
        vim.cmd("nohlsearch")
      end
    end, { noremap = true, silent = true, desc = "Dismiss Noice popups or clear hlsearch" })
    -- -----------------------------------------------------------------------
  end,
}
