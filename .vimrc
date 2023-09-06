
set nocompatible
set nu rnu
set tabstop=4
set shiftwidth=4
source /usr/share/vim/vim90/defaults.vim

let mapleader=" "
nnoremap <leader>pv :Ex<CR>
nnoremap <C-p> :find ./**/**<Left>
nnoremap <C-s> :vim//g  ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"--cursor position
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap <leader>j :lnext<CR>zz
nnoremap <leader>k :lprev<CR>zz

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <leader>x :!chmod +x %<cr>
nnoremap <leader><leader> :source %<CR>

"--clipboard copy and paste
vnoremap <leader>y "+y
nnoremap <leader>y "+y

nnoremap <leader>Y "+Y

nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>P "+P
vnoremap <leader>p "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

"--undotree
nnoremap <leader>u :UndotreeToggle<CR>

"--undotree
nnoremap <leader>gs :Gs<CR>
