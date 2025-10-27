-- ~/.config/nvim/lua/plugins/copilot.lua (Standard Standalone Configuration)

return {
  "github/copilot.vim",
  
  -- The standard way to map lazy-loaded commands
  keys = {
    -- Toggles the Copilot service on/off
    {"<leader>co", ":Copilot<CR>", mode = "n", desc = "Toggle Copilot"}
  },
  
  cmd = "Copilot", 
  lazy = true, 
  
  init = function()
    -- These are the default/standard settings for Copilot.vim
    -- It enables inline suggestions (ghost text) and the default <Tab> acceptance.
    vim.g.copilot_suggestion_enabled = true 
    vim.g.copilot_no_tab_map = false         
    vim.g.copilot_assume_mapped = true      
  end,
  
  -- You can add a config function here if you need more customization
  -- config = function()
  --   -- For example, to map keys for navigating or dismissing suggestions
  -- end,
}
