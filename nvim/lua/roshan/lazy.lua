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
    -- treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
    -- telescope
    { 'nvim-telescope/telescope.nvim',   dependencies = { { 'nvim-lua/plenary.nvim' } } },
    -- undotree
    'mbbill/undotree',
    -- vim-fugitive
    'airblade/vim-gitgutter',
    'tpope/vim-fugitive',
    -- mason
    { 'williamboman/mason.nvim', build = ':MasonUpdate' },
    -- lsp
    'neovim/nvim-lspconfig',    -- Collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp',         -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',         -- Snippets plugin
    --colorscheme
    { 'catppuccin/nvim',         name = 'catppuccin' },
    { 'rose-pine/neovim',        name = 'rose-pine' },
    { 'rose-pine/neovim',        name = 'rose-pine' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true } },
}
