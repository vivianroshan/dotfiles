local copilot = {
	"github/copilot.vim",
	event = { "BufReadPost", "InsertEnter" },
	config = function()
		vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", {})
		vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", {})
		vim.keymap.set("i", "<M-l>", "<Plug>(copilot-accept-word)", {})
		vim.keymap.set("i", "<M-S-l>", "<Plug>(copilot-accept-line)", {})
		vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", {})
		vim.keymap.set("i", "<M-i>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}

--return {}
return { copilot }
