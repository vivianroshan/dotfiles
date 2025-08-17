local telescope = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Telescope",
	keys = {
-- stylua: ignore start
		{ "<leader>pf", function() require("telescope.builtin").find_files() end, mode = "n", desc = "find_files", },
		{ "<leader>ph", function() require("telescope.builtin").find_files({ hidden = true, prompt_prefix = "🔎" }) end, mode = "n", desc = "find_files_hidden", },
		{ "<M-p>", function() require("telescope.builtin").git_files() end, mode = "n", desc = "git_files", },
		{ "<leader>ps", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, mode = "n", desc = "grep_string", },
		{ "<leader>pl", function() require("telescope.builtin").live_grep() end, mode = "n", desc = "live_grep", },
		{ "<leader>pht", function() require("telescope.builtin").help_tags() end, mode = "n", desc = "help_tags", },
		{ "<leader>pw", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end, mode = "n", desc = "grep_string", },
		{ "<leader>pW", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end, mode = "n", desc = "grep_string", },
		{ "<leader>pb", function() require("telescope.builtin").buffers() end, mode = "n", desc = "buffers", },
		{ "<leader>pgc", function() require("telescope.builtin").git_commits() end, mode = "n", desc = "git_commits", },
		{ "<leader>pgb", function() require("telescope.builtin").git_branches() end, mode = "n", desc = "git_branches", },
		{ "<leader>pgs", function() require("telescope.builtin").git_status() end, mode = "n", desc = "git_status", },
		-- stylua: ignore end
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
			},
			layout_config = {
				width = 0.95,
				height = 0.95,
				--preview_width = 0.25,
			},
			--borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			winblend = 3,
		},
	},
}
local fzf_lua = {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	-- opts = {},
  keys = {
    { "<leader>pf", function() require("fzf-lua").files() end, mode = "n", desc = "find_files" },
    { "<leader>ph", function() require("fzf-lua").files({ hidden = true }) end, mode = "n", desc = "find_files_hidden" },
    { "<M-p>", function() require("fzf-lua").git_files() end, mode = "n", desc = "git_files" },
    { "<leader>ps", function() require("fzf-lua").grep({ search = vim.fn.input("Grep > ") }) end, mode = "n", desc = "grep" },
    { "<leader>pl", function() require("fzf-lua").live_grep() end, mode = "n", desc = "live_grep" },
    { "<leader>pht", function() require("fzf-lua").help_tags() end, mode = "n", desc = "help_tags" },
    { "<leader>pw", function() require("fzf-lua").grep({ search = vim.fn.expand("<cword>") }) end, mode = "n", desc = "grep_string" },
    { "<leader>pW", function() require("fzf-lua").grep({ search = vim.fn.expand("<cWORD>") }) end, mode = "n", desc = "grep_string" },
    { "<leader>pb", function() require("fzf-lua").buffers() end, mode = "n", desc = "buffers" },
    { "<leader>pgc", function() require("fzf-lua").git_commits() end, mode = "n", desc = "git_commits" },
    { "<leader>pgb", function() require("fzf-lua").git_branches() end, mode = "n", desc = "git_branches" },
    { "<leader>pgs", function() require("fzf-lua").git_status() end, mode = "n", desc = "git_status" },
  },
	config = function()
		require("fzf-lua").setup({"telescope",winopts={height = 0.95, width = 0.95}})
	end,
}

-- return { telescope }
return { fzf_lua }
