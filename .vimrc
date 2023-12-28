set number
set relativenumber
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set noswapfile
set nobackup
set incsearch
set signcolumn=yes

" fold
syntax on
set foldmethod=syntax
set nofoldenable
set laststatus=2
colorscheme slate
source /usr/share/vim/**/defaults.vim
let mapleader=" "
nnoremap <leader>pv :Ex<CR>
nnoremap <leader><C-p> :find ./**/**<Left>
nnoremap <C-s> :lvim//g  ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


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
vnoremap <leader>p <ESC>gv"_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>m :silent make<CR>

if has('nvim')
else
  "--undotree
  nnoremap <leader>u :UndotreeToggle<CR>
  let g:undotree_WindowLayout = 3
  "--persistent_undo
  let target_path = expand('~/.vim/undodir')
  if !isdirectory(target_path)
      call mkdir(target_path, "p", 0700)
  endif
  "--fugitive
  nnoremap <leader>gs :Git<CR>
endif

