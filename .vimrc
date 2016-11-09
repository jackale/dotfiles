set number
set cursorline
set shiftwidth=4
set clipboard=unnamed,unnamedplus

set encoding=utf-8
scriptencoding utf-8

" python path for denite.nvim
let g:python3_host_prog = expand('/usr/local/bin/python3')

" Change cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Clear Autocmd
augroup MyAutoCmd
	autocmd!
augroup END

"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))
    
    let g:dein_dir = expand('~/.vim/dein')
    let s:toml = g:dein_dir . '/dein.toml'
    " let s:toml_lazy = g:dein_dir . '/dein_lazy.toml'

    call dein#load_toml(s:toml, {"lazy": 0})
    " call dein#load_toml(s:toml_lazy, {"lazy": 2})

    " Denite setting
    call denite#custom#var('grep', 'command', ['hw'])
    call denite#custom#var('grep', 'default_opts', ['--nocolor', '--nogroup'])

    call dein#end()
    call dein#save_state()
endif

"hi CursorLine ctermfg=blue

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" lightline seting
set laststatus=2
let g:lightline = {
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ }


" --- Mapping ---

" Escape at insert mode
inoremap <silent> jj <ESC>

" Emacs bind
noremap <silent> <C-a> <Home>
noremap <silent> <C-e> <End>
noremap <silent> <C-b> <Left>
noremap <silent> <C-f> <Right>
noremap <silent> <C-d> <ESC>xi
noremap <silent> <C-k> <ESC>d$a

inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-d> <ESC>xi
inoremap <silent> <C-k> <ESC>d$a
