local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup {
    { import = 'roshan.plugins' },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', function() vim.cmd.UndotreeToggle(); end, mode = 'n' },
        },
    },
    {
        'airblade/vim-gitgutter',
        event = { "BufReadPost" },
    },
    {
        'tpope/vim-fugitive',
        keys = {
            { '<leader>gs', function() vim.cmd.Git(); end, mode = 'n' },
        },
    },
}
