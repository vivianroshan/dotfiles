set nocompatible
let mapleader=" "

if (has("termguicolors"))
  set termguicolors
endif

syntax on
set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set hlsearch
set signcolumn=auto
set laststatus=2
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
set history=200
set ruler
set showcmd
set wildmenu
set wildmode=longest:full,full
set wildoptions=fuzzy,pum,tagfile
"--set ttimeout
"--set ttimeoutlen=2000
set display=truncate,uhex
inoremap <C-U> <C-G>u<C-U>
if has('reltime')
  set incsearch
endif
if has('mouse')
    set mouse=nvi
endif
set scrolloff=5
filetype plugin indent on

"--fold
set foldmethod=syntax
set nofoldenable

"--undotree setup
let g:undotree_WindowLayout = 3

"-- restore cursor position
augroup vimStartup
  autocmd!
  autocmd BufReadPost *
    \ let line = line("'\"")
    \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
    \      && index(['xxd', 'gitrebase'], &filetype) == -1
    \ |   execute "normal! g`\""
    \ | endif
augroup END

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

if !has('nvim')

  "--directory setup
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
  set backupdir=$HOME/.vim/backupdir/
  set directory=$HOME/.vim/swapdir/

  "--statusline
  augroup UpdateDiffSummary
    autocmd!
    autocmd BufReadPost * let b:git_diff_summary = GetGitDiffSummary()
    autocmd BufWritePost * let b:git_diff_summary = GetGitDiffSummary()
  augroup END
  set statusline=
  set statusline+=\ %{get(b:,'git_diff_summary')}
  set statusline+=\ %<%f
  set statusline+=\ %h%m%r
  set statusline+=%=%-14.(%y\ %l,%c%V%)\ %P

  "--fzf
  set rtp+=/opt/homebrew/opt/fzf

  "--editorconfig
  packadd editorconfig

  "--colorscheme
  "--colorscheme desert
  set background=dark
  colorscheme gruvbox

  "--grep
  nnoremap <leader><C-s> :silent grep -ir '' .<Left><Left><Left>
else
  "--rg
  nnoremap <leader><C-s> :silent grep -i '' .<Left><Left><Left>
endif

set undofile

"--custom functions
function! GetGitDiffSummary()
  let l:git_command = "git diff --numstat -- " . shellescape(expand('%')) . " 2>/dev/null"
  let l:adds = trim(system(l:git_command . " | awk '{print($1)}'"))
  let l:subs = trim(system(l:git_command . " | awk '{print($2)}'"))
  if l:adds == "" || l:subs == ""
    return "" 
  else
    return "+" . l:adds . " | " . "-" . l:subs . " >>"
  endif
endfunction

function! Quickfix_loclist_win_status()
  let winid = win_getid()
  let wininfo = getwininfo()
  let l:quickfix = 0
  let l:loclist = 0
  for info in wininfo
    let l:quickfix = l:quickfix || (info['quickfix'] && !info['loclist'])
    let l:loclist = l:loclist || info['loclist']
  endfor
  return {'quickfix': l:quickfix, 'loclist': l:loclist}
endfunction

function! Toggle_quickfix_or_loclist(args1)
  let info = Quickfix_loclist_win_status()
  if (a:args1 == 'c' && info['quickfix'] == 0) || (a:args1 == 'l' && info['loclist'] == 0)
    execute a:args1 .. 'open'
  elseif (a:args1 == 'c' && info['quickfix'] == 1) || (a:args1 == 'l' && info['loclist'] == 1)
    execute a:args1 .. 'close'
  end
endfunction

function! Toggle_color_column(arg1)
  if &colorcolumn == ''
    execute "set colorcolumn=" .. a:arg1
  else
    set colorcolumn=
  endif
endfunction

function! s:NewJournalEntry(name)
  if a:name == ""
    let l:filename = strftime("%Y-%m-%d") . ".md"
  else
    let l:filename = strpart(a:name, 1, len(a:name) - 2)
  endif
  execute "edit " . expand('~') . "/Developer/journal/" . l:filename
  normal G
endfunction

"--harpoon
function! s:refreshSpecialMarks()
  let s:specialMarks = [ 'H', 'J', 'K', 'L' ]
  for mark in s:specialMarks
    let mark_pos = getpos("'" . mark)
    if mark_pos[0] == bufnr()
      call setpos("'" . mark, getpos('.'))
    endif
  endfor
endfunction

augroup Harpoon
  autocmd!
  autocmd BufLeave * call s:refreshSpecialMarks()
augroup END

"--journal
command! -nargs=? Journal call s:NewJournalEntry('<f-args>')

"--project search
nnoremap <leader>pv :Ex<CR>
nnoremap <leader><C-p> :find ./**/**<Left>
nnoremap <C-s> :vim//g ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
"--grep see has('nvim') block

"--quickfix
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap <leader>j :lnext<CR>zz
nnoremap <leader>k :lprev<CR>zz

"--mark harpoon
nnoremap <M-h> `H
nnoremap <M-j> `J
nnoremap <M-k> `K
nnoremap <M-l> `L
nnoremap <M-;> `H

"--source and chmod
nnoremap <leader><M-s> :source %<CR>
nnoremap <leader><C-x> :!chmod +x %<CR>

nnoremap <leader>we <CMD>w<CR><CMD>e<CR>
nnoremap <leader>rr <CMD>e<CR>
nnoremap <leader>re <CMD>e!<CR>
nnoremap <leader>x gv"zy'<"zP`>
vnoremap <leader>x <ESC>gv"zy'<"zPgv:.!bash<CR>
vnoremap <leader>c :.!jq .<CR>
vnoremap <leader>v :.!jq -c .<CR>
vnoremap <leader>m :.!sh ~/Developer/tools/scripts/f_md.sh 
nnoremap <M-S-h> 5zh
nnoremap <M-S-l> 5zl

"--line move
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

"--functions based on custom functions
nnoremap <leader>qf :call Toggle_quickfix_or_loclist('c')<CR>
nnoremap <leader>ql :call Toggle_quickfix_or_loclist('l')<CR>
nnoremap <leader>c :call Toggle_color_column(80)<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>gs :Git<CR>

"--git mergetool"
let maplocalleader="\\"
nnoremap <localleader>o :diffget LOCAL<CR>
nnoremap <localleader>b :diffget BASE<CR>
nnoremap <localleader>t :diffget REMOTE<CR>

if has('nvim')
  lua dofile(vim.fn.stdpath('config') .. '/init_lazy.lua')
endif
