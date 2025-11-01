-- ~/dotfiles/nvim/lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  submodules = true,          -- <‑‑ crucial for the jsregexp submodule
  event = "InsertEnter",     -- load when you start inserting text
  config = function()
    -- Example basic config – feel free to expand
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
