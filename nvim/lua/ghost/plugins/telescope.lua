local telescope = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  cmd = 'Telescope',
  keys = {
    {
      '<leader>pf',
      function() require('telescope.builtin').find_files() end,
      mode = 'n',
    },
    {
      '<leader>ph',
      function() require('telescope.builtin').find_files({ hidden = true, prompt_prefix='🔎' }) end,
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
      function()
        require('telescope.builtin')
            .grep_string({ search = vim.fn.input("Grep > ") })
      end,
      mode = 'n',
    },
  }
}

return telescope
