local undotree = {
  'mbbill/undotree',
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
  keys = {
    { '<leader>gs', function() vim.cmd.Git(); end, mode = 'n' },
  },
}
local todo_comments = {
  "folke/todo-comments.nvim",
  dependency = { 'nvim-lua/plenary.nvim' },
  event = { "BufReadPost" },
  opts = {},
}

return {undotree, gitgutter, vim_fugitive, todo_comments}
