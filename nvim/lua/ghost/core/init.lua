vim.cmd("source ~/.vimrc")

function PythonTraceback()
	vim.opt.errorformat = [[\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m]]
end

ColorColumn = ""
function ToggleColorColumn(col)
	col = col or ColorColumn
	if ColorColumn > "-1" then
		ColorColumn = "-1"
	else
		ColorColumn = "80"
	end
	vim.opt.colorcolumn = col
end

function ToggleQuickfix(list_type)
	local qf_exists = false
	local quickfix = (list_type == "quickfix")
	local list_cmd = quickfix and "c" or "l"
	local list_data = quickfix and vim.fn.getqflist() or vim.fn.getloclist(0)
	for _, win in pairs(vim.fn.getwininfo()) do
		if win[list_type] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd(list_cmd .. "close")
		return
	end
	if not vim.tbl_isempty(list_data) then
		vim.cmd(list_cmd .. "window")
	end
end

function ColorScheme(clr)
	local color = clr or "github_dark_default"
	vim.cmd.colorscheme(color)
end

function ToggleBackground()
	vim.cmd.colorscheme(vim.g.colors_name)
	if Background == 0 then
		Background = 1
	else
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		Background = 0
	end
	print(Background)
end

vim.keymap.set("n", "<leader>b", function()
	ToggleBackground()
end)

ToggleColorColumn(ColorColumn)
vim.keymap.set("n", "<leader>pt", function() PythonTraceback() end)
vim.keymap.set("n", "<leader>c", function() ToggleColorColumn() end)
vim.keymap.set("n", '<leader>qf', function() ToggleQuickfix("quickfix") end, { silent = true })
vim.keymap.set("n", '<leader>ql', function() ToggleQuickfix("loclist") end, { silent = true })
