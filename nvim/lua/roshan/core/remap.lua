vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><C-p>", [[:find ./**/**<Left>]])
vim.keymap.set("n", "<C-s>", [[:lvim//g  ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--cursor position
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><C-s>", function()
    vim.cmd("so")
end)

--clipboard copy and paste
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [[<Esc>gv"+y]])

vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("v", "<leader>p", [[<Esc>gv"+p]])

vim.keymap.set("n", "<leader>P", [["+P]])
vim.keymap.set("v", "<leader>P", [[<Esc>gv"+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
