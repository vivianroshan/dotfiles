local colorscheme = {
  { "folke/tokyonight.nvim",       name = "tokyonight-cs" },
  { "rose-pine/neovim",            name = "rose-pine-cs" },
  { "catppuccin/nvim",             name = "catppuccin-cs" },
  { "projekt0n/github-nvim-theme", name = "github-cs" },
  { "rose-pine/neovim",            name = "rose-pine-cs" },
  { "EdenEast/nightfox.nvim",      name = "nightfox-cs" },
}

local gruvbox = {
  "morhetz/gruvbox",
  event = { "VeryLazy" },
  config = function()
    vim.cmd("colorscheme gruvbox")
  end,
}

local nightfox = {
  "EdenEast/nightfox.nvim",
  event = { "VeryLazy" },
  config = function()
    vim.cmd("colorscheme carbonfox")
  end,
}

local lualine = {
  "nvim-lualine/lualine.nvim",
  event= { "VeryLazy" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "EdenEast/nightfox.nvim",
--    "morhetz/gruvbox",
  },
  config = function()
    require("lualine").setup({
--      options = {
--        theme = "gruvbox",
--      },
    })
  end,
}

--return { gruvbox, colorscheme, lualine }
return { nightfox, lualine }
