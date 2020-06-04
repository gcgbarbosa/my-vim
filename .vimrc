"set nocompatible              " required
"filetype off                  " required

" CHANGING THE PACKAGE MANAGER
call plug#begin('~/.vim/plugged')
  " enable fuzzy search with ctrl+p
  Plug 'kien/ctrlp.vim'
  " enable autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " another try to get indent lines
  Plug 'nathanaelkane/vim-indent-guides'
  " integration with github.
  " this seemed to be a better option than the popular gigtutter
  Plug 'mhinz/vim-signify'
  " to use git without leaving vim
  Plug 'tpope/vim-fugitive'
  " changed appearence
  Plug 'altercation/vim-colors-solarized'
call plug#end()

" configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" ljine Numbering
set nu
" relative numbering
:set relativenumber

" enable filetype detection and indent
filetype plugin indent on
" on pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" UTF-8 Suppoert
set encoding=utf-8

" remap split navigations - you press ctrl+<direction> to go to the new pane?
" TODO: i guess i don't need this
nnoremap <C-J> <C-W><C-J> nnoremap <C-K> <C-W><C-K> nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" backspace key was not deleting a couple of stuff
" this command fixes it
:set backspace=indent,eol,start

" this is not needed anymore.
" esc now is capslock
" remapping escape to ESC
" inoremap jk <ESC>

" kill the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" display ^ for tabs and $ at the end of each line
set list

" changing color scheme
syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" enable shit with clipboard (like pasting from ctr+c)
set clipboard=unnamedplus

" set the size of the register
set viminfo='1000,<1000,s1000,h

" powerline
set rtp+=/home/gcgbarbosa/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" COC.VIM 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages. (this originally was 2, but I did
" not like the way it looks.
" set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"" end of powerline

" enable vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" enable prettier with :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ignore .gitignore files when using ctrl+p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" configuration for vim-signify
" default update time 4000s is not got for async update
set updatetime=100


