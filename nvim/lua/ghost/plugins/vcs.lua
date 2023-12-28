return {
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
    {
        "folke/todo-comments.nvim",
        dependency = { 'nvim-lua/plenary.nvim' },
        event = { "BufReadPost" },
        opts = {},
    },
    {
        "folke/zen-mode.nvim",
        cmd = 'ZenMode',
        opts = {
            window = {
                backdrop = 0.8,
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true,
                    showcmd = true,
                    laststatus = 3,
                },
                gitsigns = { enabled = true },
                tmux = { enabled = false },
            },
        },
    },
}
