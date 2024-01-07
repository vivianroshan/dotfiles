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
	print(col)
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

ToggleColorColumn(ColorColumn)
vim.keymap.set("n", "<leader>pt", function() PythonTraceback() end)
vim.keymap.set("n", "<leader>c", function() ToggleColorColumn() end)
vim.keymap.set("n", '<leader>qf', function() ToggleQuickfix("quickfix") end, { silent = true })
vim.keymap.set("n", '<leader>ql', function() ToggleQuickfix("loclist") end, { silent = true })
