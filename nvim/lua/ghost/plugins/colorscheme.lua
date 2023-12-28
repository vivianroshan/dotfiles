return {
  {
    -- 'catppuccin/nvim',                  name = 'catppuccin-cs',
    -- 'rose-pine/neovim',                 name = 'rose-pine-cs',
    -- 'folke/tokyonight.nvim',            name = 'tokyonight-cs',
    'projekt0n/github-nvim-theme',
    name = 'github-cs',
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
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('lualine').setup()
    end,
  },
}
