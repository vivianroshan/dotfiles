local colorscheme = {
  { "folke/tokyonight.nvim",       name = "tokyonight-cs" },
  { "rose-pine/neovim",            name = "rose-pine-cs" },
  { "catppuccin/nvim",             name = "catppuccin-cs" },
  { "projekt0n/github-nvim-theme", name = "github-cs" },
  { "rose-pine/neovim",            name = "rose-pine-cs" }
}

local gruvbox = {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme gruvbox")
  end,
}

local lualine = {
  "nvim-lualine/lualine.nvim",
  lazy= false,
  priority = 1000,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
      },
    })
  end,
}

return { colorscheme, gruvbox, lualine }
