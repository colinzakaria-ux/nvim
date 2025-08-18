-- ~/.config/nvim/lua/plugins/chatgpt.lua (Corrected Version)

return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    -- Add this line to install Telescope
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("chatgpt").setup({
      -- API key is read from OPENAI_API_KEY environment variable
    })
    -- Setup keymaps
    vim.keymap.set("n", "<leader>ca", ":ChatGPT<CR>", { desc = "ChatGPT Ask" })
    vim.keymap.set("v", "<leader>ce", ":ChatGPTEditWithInstructions<CR>", { desc = "ChatGPT Edit (Visual)" })
  end,
}
