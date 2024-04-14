local colorscheme = {
  { "folke/tokyonight.nvim", name = "tokyonight-cs" },
  { "rose-pine/neovim",      name = "rose-pine-cs" },
  { "catppuccin/nvim",       name = "catppuccin-cs" },
}

local github_dark_tritanopia = {
  "projekt0n/github-nvim-theme",
  name = "github-cs",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      -- ...
    })

    vim.cmd("colorscheme github_dark_tritanopia")
  end,
}

local rose_pine = {
  "rose-pine/neovim",
  name = "rose-pine-cs",
  config = function()
    require("rose-pine").setup({
      variant = "auto",      -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = false,

      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        headings = {
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        -- Alternatively, set all headings at once.
        -- headings = "subtle",
      },

      highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    })
    vim.cmd("colorscheme rose-pine")
    -- vim.cmd('colorscheme rose-pine-main')
    -- vim.cmd('colorscheme rose-pine-moon')
    -- vim.cmd('colorscheme rose-pine-dawn')
  end,
}
local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin-cs",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
      term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,             -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,           -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,             -- Force no italic
      no_bold = false,               -- Force no bold
      no_underline = false,          -- Force no underline
      styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {},               -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
  end,
}

local lualine = {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      --options = {
      --theme = "catppuccin",
      --},
    })
  end,
}

-- return { colorscheme, catppuccin, lualine }
-- return { colorscheme,catppuccin, rose_pine, lualine }
-- return { colorscheme, catppuccin, rose_pine }
return { colorscheme, github_dark_tritanopia, lualine }
