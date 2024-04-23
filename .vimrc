set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
"-- set noswapfile
"-- set nobackup
set incsearch
set signcolumn=yes
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

"--fold
syntax on
set foldmethod=syntax
set nofoldenable
set laststatus=2
source /usr/share/vim/**/defaults.vim
colorscheme slate
let mapleader=" "
nnoremap <leader>pv :Ex<CR>
nnoremap <leader><C-p> :find ./**/**<Left>
nnoremap <C-s> :vim//g  ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap <leader>j :lnext<CR>zz
nnoremap <leader>k :lprev<CR>zz
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <leader>x :!chmod +x %<cr>
nnoremap <leader><C-s> :source %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"--cursor position
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

"--clipboard copy and paste
nnoremap <leader>y "+y
vnoremap <leader>y <ESC>gv"+y

nnoremap <leader>Y "+Y

nnoremap <leader>p "+p
vnoremap <leader>p <ESC>gv"+p

nnoremap <leader>P "+P
vnoremap <leader>P <ESC>gv"_+P

nnoremap <leader>m :silent make<CR>

let g:undotree_WindowLayout = 3

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
if !isdirectory($HOME."/.vim/backupdir")
    call mkdir($HOME."/.vim/backupdir", "", 0700)
endif
if !isdirectory($HOME."/.vim/directory")
    call mkdir($HOME."/.vim/directory", "", 0700)
endif

set undodir=$HOME/.vim/undodir/
set undofile
set backupdir=$HOME/.vim/backupdir/
set directory=$HOME/.vim/swapdir/

function! GetGitDiffSummary()
  let l:git_command = "git diff --numstat -- " . shellescape(expand('%'))
  let l:adds = "+".trim(system(l:git_command . " | awk '{print($1)}'"))
  let l:subs = "-".trim(system(l:git_command . " | awk '{print($2)}'"))
  return l:adds."/".l:subs
endfunction

if has('nvim')
else
  nnoremap <leader>u :UndotreeToggle<CR>
  nnoremap <leader>gs :Git<CR>
  augroup UpdateDiffSummary
    autocmd!
    autocmd BufReadPost * let b:git_diff_summary = GetGitDiffSummary()
    autocmd BufWritePost * let b:git_diff_summary = GetGitDiffSummary()
  augroup END
  set statusline=%{get(b:,'git_diff_summary')}\ %<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
endif
