local copilot = {
	"github/copilot.vim",
	event = { "BufReadPost", "InsertEnter" },
	config = function()
		vim.keymap.set("i", "<M-j>", "<Plug>(copilot-next)", {})
		vim.keymap.set("i", "<M-k>", "<Plug>(copilot-previous)", {})
		vim.keymap.set("i", "<M-l>", "<Plug>(copilot-accept-word)", {})
		vim.keymap.set("i", "<M-L>", "<Plug>(copilot-accept-line)", {})
		vim.keymap.set("i", "<M-]>", "<Plug>(copilot-dismiss)", {})
	end,
}

return copilot
