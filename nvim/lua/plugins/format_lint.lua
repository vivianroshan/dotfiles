local conform = {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "autopep8" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      tex = { "latexindent" },
      lua = { "stylua" },
      json = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      --java = { "google-java-format" },
      bash = { "shfmt" },
      sh = { "shfmt" },
    },
  },
}
local nvim_lint = {
  "mfussenegger/nvim-lint",
  keys = { 
    {
      "<leader>l",
      function()
        require("lint").try_lint()
      end,
      mode = "n",
      desc = "Lint buffer",
    },
  },
  config = function()
    require("lint").linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      python = { "pylint" },
    }
  end,
}

return { conform, nvim_lint }
