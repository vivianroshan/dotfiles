local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "mason-org/mason.nvim", opts = {} },
		{ "neovim/nvim-lspconfig" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ import = "plugins" },
		{
			"catppuccin/nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("catppuccin").setup({
					integrations = {
						gitgutter = true,
						treesitter = true,
						telescope = true,
					},
				})
				--vim.cmd([[colorscheme catppuccin]])
			end,
		},
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("tokyonight").setup({})
				--vim.cmd([[colorscheme tokyonight]])
			end,
		},
		-- { "folke/which-key.nvim", event = { "VeryLazy" } },
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("pyright")
vim.lsp.enable({ "ts_ls", "html", "cssls", "tailwindcss" })
vim.lsp.enable("grammarly")
-- "gopls", "clangd", "rust_analyzer"
--  "jdtls"

vim.lsp.config("*", {
	inlay_hints = {
		enabled = true,
		-- show_type_hints = false,
		-- show_parameter_hints = false,
		-- show_parameter_name_hints = false,
	},
})

vim.cmd([[set completeopt+=menuone,noselect,popup]])
vim.cmd([[colorscheme habamax]])
