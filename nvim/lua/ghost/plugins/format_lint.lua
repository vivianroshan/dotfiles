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
			javascript = { { "prettierd", "prettier" } },
			tex = { "latexindent" },
			lua = { "stylua" },
		},
	},
}
local nvim_lint = {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			python = { "pylint" },
		}

		--		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		--
		--		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		--			group = lint_augroup,
		--			callback = function()
		--				lint.try_lint()
		--			end,
		--		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}

return { conform, nvim_lint }
