-- ~/.config/nvim/lua/plugins/autopairs.lua

return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    local autopairs = require('nvim-autopairs')
    autopairs.setup({
      check_ts = true, -- Check treesitter
      ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
        java = false,
      }
    })

    -- This is to make nvim-cmp and nvim-autopairs play nice
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
