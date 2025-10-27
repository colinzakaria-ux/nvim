-- ~/.config/nvim/lua/plugins/lsp.lua (Standard LSP & Autocompletion Configuration)

return {
  -- LSP Configuration & Manager
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- This function gets called when an LSP attaches to a buffer
      local on_attach = function(_, bufnr)
        -- In this case, we create keymaps only for the current buffer
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
        end

        nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
        nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
        nmap('gd', vim.lsp.buf.definition, 'Go to Definition')
        nmap('gr', vim.lsp.buf.references, 'Go to References')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      end

      -- Setup mason so it can manage LSPs
      require("mason").setup()
      
      require("mason-lspconfig").setup({
        -- A list of servers to automatically install if they're not already installed
        ensure_installed = { "lua_ls" },
        handlers = {
          function(server_name) -- default handler (for servers that require no special options)
            require("lspconfig")[server_name].setup({
              on_attach = on_attach,
            })
          end,
        }
      })
    end,
  },

  -- Autocompletion (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", 
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      -- The Copilot bridge plugin 'zbirenbaum/copilot-cmp' has been removed.
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        -- Copilot source removed. Prioritizing LSP and snippets.
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        
        mapping = cmp.mapping.preset.insert({
          -- Standard navigation keys
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(), -- <C-j> restored for navigation
          
          -- <CR> (Enter) now accepts the selected suggestion by default
          -- select=false prevents auto-selection and allows you to type to filter
          ['<CR>'] = cmp.mapping.confirm({ select = false }), 
          
          -- Optional: You can still use <C-Space> to manually trigger or refine suggestions
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end,
  },
}
