return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<M-j>", "<Plug>(copilot-next)", {})
		vim.keymap.set("i", "<M-k>", "<Plug>(copilot-previous)", {})
		vim.keymap.set("i", "<M-l>", "<Plug>(copilot-accept-word)", {})
		vim.keymap.set("i", "<M-L>", "<Plug>(copilot-accept-line)", {})
		--<C-]> <Plug>(copilot-dismiss)
		--<M-\> <Plug>(copilot-suggest) is disabled.
	end,
}
