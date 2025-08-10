local undotree = {
  'mbbill/undotree',
  event = { "VeryLazy"},
  keys = {
    { '<leader>u', function() vim.cmd.UndotreeToggle(); end, mode = 'n' },
  },
}
local gitgutter = {
  'airblade/vim-gitgutter',
  event = { "BufReadPost" },
}
local vim_fugitive = {
  'tpope/vim-fugitive',
  event = { "VeryLazy"},
  keys = {
    { '<leader>gs', function() vim.cmd.Git(); end, mode = 'n' },
  },
}

return { undotree, gitgutter, vim_fugitive, todo_comments }
