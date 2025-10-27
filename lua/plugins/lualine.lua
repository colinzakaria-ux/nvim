-- plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",                     -- load after startup, no penalty
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
  opts = {
    options = {
      theme = "auto",                     -- auto-detect your colorscheme
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      icons_enabled = true,
    },

    -- Left side of the statusline
    sections = {
      lualine_a = { "mode" },            -- NORMAL, INSERT, etc.
      lualine_b = { "branch", "diff" },  -- git branch + diff stats
      lualine_c = {
        {
          "filename",
          path = 1,                      -- show relative path
        },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },        -- % of file scrolled
      lualine_z = { "location" },        -- line, column
    },

    -- Right side (inactive windows)
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {}
    },

    -- Extensions for specific plugins / filetypes
    extensions = { "nvim-tree", "quickfix", "fugitive" },
  },

  config = function(_, opts)
    require("lualine").setup(opts)

    -- OPTIONAL: add a custom component that shows the current ZSH virtualenv
    local function venv()
      local v = os.getenv("VIRTUAL_ENV")
      if v then
        return " " .. vim.fn.fnamemodify(v, ":t")
      end
      return ""
    end

    -- Insert the custom component into the left side, after mode
    table.insert(opts.sections.lualine_a, venv)
    require("lualine").setup(opts)   -- re‑apply with the new component
  end,
}
