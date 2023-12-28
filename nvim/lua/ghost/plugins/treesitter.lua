return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/playground' },
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  event = { "BufReadPost" },
  cmd = { "TSUpdate" },
  build = ':TSUpdate',

  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
    vim.opt.foldmethod = "expr";
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()";
    vim.opt.foldenable = false;
  end
}
