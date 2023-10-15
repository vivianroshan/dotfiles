return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim', lazy = true },
    },
    cmd = 'Telescope',
    keys = {
        {
            '<leader>pf',
            function() require('telescope.builtin').find_files() end,
            mode = 'n',
        },
        {
            '<C-p>',
            function() require('telescope.builtin').git_files() end,
            mode = 'n',
        },
        {
            '<leader>vh',
            function() require('telescope.builtin').help_tags() end,
            mode = 'n',
        },
        {
            '<leader>ps',
            function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end,
            mode = 'n',
        },
    }
}
