function GetQueryDriver()
  local queryDriver = {
    "/opt/homebrew/bin/gcc-14",
    "/opt/homebrew/bin/g++-14",
    "/opt/homebrew/bin/riscv64-unknown-elf-gcc",
    "/opt/homebrew/bin/riscv64-unknown-elf-g++",
  }
  local queryDriverStr = '--query-driver="'
  for i, v in ipairs(queryDriver) do
    queryDriverStr = queryDriverStr .. v
    if i < #queryDriver then
      queryDriverStr = queryDriverStr .. ","
    end
  end
  queryDriverStr = queryDriverStr .. '"'
  return queryDriverStr
end

local lsp = {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "InsertEnter" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
  dependencies = {
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "j-hui/fidget.nvim",
  },
  config = function()
    require("fidget").setup()
    require("mason").setup()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "lua_ls",
        "bashls",
        "grammarly",
        "html",
        "cssls",
        "tailwindcss",
        "ts_ls",
        "gopls",
        "pyright",
        "rust_analyzer",
        "kotlin_language_server",
        "jdtls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            inlay_hints = {
              enabled = true,
              -- show_type_hints = false,
              -- show_parameter_hints = false,
              -- show_parameter_name_hints = false,
            },
          })
        end,
        ["grammarly"] = function()
          lspconfig.grammarly.setup({
            --filetypes = { "markdown", "text", "tex" },
            filetypes = { "text", "tex" },
          })
        end,
        ["emmet_language_server"] = function()
          lspconfig.emmet_language_server.setup({
            capabilities = capabilities,
            showSuggestionsAsSnippets = true,
          })
        end,
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {'clangd', GetQueryDriver()},
          })
        end,
        ["jdtls"] = function()
        end,
      },
    })

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<leader>f', function()
        --   vim.lsp.buf.format { async = true }
        -- end, opts)
      end,
    })
    function MasonInstallFormatters()
      vim.cmd("MasonInstall autopep8 prettierd stylua latexindent")
    end
  end,
}

return lsp
