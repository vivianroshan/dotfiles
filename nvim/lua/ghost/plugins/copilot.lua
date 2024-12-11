local copilot = {
  "github/copilot.vim",
  event = { "BufReadPost", "InsertEnter" },
  config = function()
    vim.keymap.set("i", "<M-S-j>", "<Plug>(copilot-next)", {})
    vim.keymap.set("i", "<M-S-k>", "<Plug>(copilot-previous)", {})
    vim.keymap.set("i", "<M-l>", "<Plug>(copilot-accept-word)", {})
    vim.keymap.set("i", "<M-L>", "<Plug>(copilot-accept-line)", {})
    vim.keymap.set("i", "<M-]>", "<Plug>(copilot-dismiss)", {})
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<M-i>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
  end,
}

return copilot
