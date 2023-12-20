return {
  {
    --    'catppuccin/nvim',
    --    name = 'catppuccin',
    'nvim-lualine/lualine.nvim',
    priority = 1000,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'catppuccin/nvim',                  name = 'catppuccin-cs', lazy = 'true' },
      { 'rose-pine/neovim',                 name = 'rose-pine-cs',  lazy = 'true' },
      { 'folke/tokyonight.nvim',            name = 'tokyonight-cs', lazy = 'true' },
      { 'marko-cerovac/material.nvim',      name = 'material-cs',   lazy = 'true' },
      { 'ellisonleao/gruvbox.nvim',         name = 'gruvbox-cs',    lazy = 'true' },
      { 'nyoom-engineering/oxocarbon.nvim', name = 'oxocarbon-cs',  lazy = 'true' },
      { 'projekt0n/github-nvim-theme',      name = 'github-cs',     lazy = 'true' },
    },
    config = function()
      function ColorScheme(clr)
        local color = clr or 'github_dark_default'
        vim.cmd.colorscheme(color)
      end

      function ToggleBackground()
        vim.cmd.colorscheme(vim.g.colors_name)
        if Background == 0 then
          Background = 1
        else
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
          Background = 0
        end
        print(Background)
      end

      vim.keymap.set("n", "<leader>b", function()
        ToggleBackground();
      end)
      ColorScheme()
      ToggleBackground()
      require('lualine').setup()
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          RGB = true,        -- #RGB hex codes
          RRGGBB = true,     -- #RRGGBB hex codes
          names = true,      -- "Name" codes like Blue or blue
          RRGGBBAA = true,  -- #RRGGBBAA hex codes
          AARRGGBB = true,  -- 0xAARRGGBB hex codes
          rgb_fn = true,    -- CSS rgb() and rgba() functions
          hsl_fn = true,    -- CSS hsl() and hsla() functions
          css = true,       -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "virtualtext", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = false,                              -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      }
    end
  }
}
