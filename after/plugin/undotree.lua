vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- if true then
    local target_path = vim.fn.expand('~/.vim/undodir')
    if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0700)
    end
    vim.opt.undodir = target_path
    vim.opt.undofile = true
-- end
