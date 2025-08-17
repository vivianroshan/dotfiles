local undotree = {
	"mbbill/undotree",
	event = { "VeryLazy" },
	keys = {
		{
			"<leader>u",
			function()
				vim.cmd.UndotreeToggle()
			end,
			mode = "n",
		},
	},
}
local gitgutter = {
	"airblade/vim-gitgutter",
	event = { "BufReadPost" },
}
local vim_fugitive = {
	"tpope/vim-fugitive",
	event = { "VeryLazy" },
	keys = {
		{
			"<leader>gs",
			function()
				vim.cmd.Git()
			end,
			mode = "n",
		},
	},
}

local gitlinker = {
	"linrongbin16/gitlinker.nvim",
	cmd = "GitLink",
	opts = {},
	keys = {
		{ "<leader>gl", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
		{ "<leader>gL", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
		{ "<leader>gb", "<cmd>GitLink blame<cr>", mode = { "n", "v" }, desc = "Yank git link" },
		{ "<leader>gB", "<cmd>GitLink! blame<cr>", mode = { "n", "v" }, desc = "Open git link" },
		{ "<leader>gc", "<cmd>GitLink current_branch<cr>", mode = { "n", "v" }, desc = "Yank git link" },
		{ "<leader>gC", "<cmd>GitLink! current_branch<cr>", mode = { "n", "v" }, desc = "Open git link" },
		{ "<leader>gd", "<cmd>GitLink default_branch<cr>", mode = { "n", "v" }, desc = "Yank git link" },
		{ "<leader>gD", "<cmd>GitLink! default_branch<cr>", mode = { "n", "v" }, desc = "Open git link" },
	},
}

return { undotree, gitgutter, vim_fugitive, gitlinker }
