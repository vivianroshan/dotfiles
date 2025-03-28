local cmp = {
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",

    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    --"rafamadriz/friendly-snippets",
    "honza/vim-snippets",
    {
      "L3MON4D3/LuaSnip",
      config = function ()
        local ls = require("luasnip")
        vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump(1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<M-C-l>", function() ls.jump(-1) end, {silent = true})
      end,
    },
  },
  event = "InsertEnter",
  config = function()
    --require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        --completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--    cmp.setup.cmdline({ "/", "?" }, {
--      mapping = cmp.mapping.preset.cmdline(),
--      sources = {
--        { name = "buffer" },
--      },
--    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--    cmp.setup.cmdline(":", {
--      mapping = cmp.mapping.preset.cmdline(),
--      sources = cmp.config.sources({
--        { name = "path" },
--      }, {
--        { name = "cmdline" },
--      }),
--    })
  end,
}

return cmp
