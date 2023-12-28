return {
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  event = { "BufReadPost", "InsertEnter" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',         -- Snippets plugin
    {
      'williamboman/mason.nvim',
      build = ':MasonUpdate',
      config = function() require('mason').setup() end,
    },
  },
  config = function()
    local servers = {
      'lua_ls',
      'clangd',
      'pylsp',
      'pyright',
      'gopls',
      'kotlin_language_server',
      'rust_analyzer',
      'tsserver',
      'tailwindcss',
      'grammarly',
    }

    local lspconfig = require 'lspconfig'
    local function lsp_setup()
      lspconfig.lua_ls.setup {}
      lspconfig.clangd.setup {}
      lspconfig.pylsp.setup {}
      lspconfig.pyright.setup {}
      lspconfig.gopls.setup {}
      lspconfig.rust_analyzer.setup {}
      lspconfig.kotlin_language_server.setup {}
      lspconfig.tsserver.setup {}
      lspconfig.tailwindcss.setup {}
      lspconfig.grammarly.setup {
        filetypes = { 'markdown', 'text', 'tex' },
      }

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader><C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          -- vim.keymap.set('n', '<leader>f', function()
          --   vim.lsp.buf.format { async = true }
          -- end, opts)
        end,
      })
    end

    local function nvimcmp_setup()
      local cmp = require 'cmp'
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end
      local luasnip = require 'luasnip'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-U>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-D>'] = cmp.mapping.scroll_docs(4),  -- Down
          -- C-b (back) C-f (forward) for snippet placeholder navigation.
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end

    lsp_setup()
    nvimcmp_setup()
  end,
}
