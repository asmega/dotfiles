filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on

" disable arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

set tabstop=2
set shiftwidth=2
set expandtab
set number

set ignorecase
set smartcase
set hlsearch
set incsearch

set autoindent

set hidden

set scrolloff=5
set novisualbell

highlight ColorColumn ctermbg=4
set colorcolumn=80

" stop being slow when long lines
set synmaxcol=120

set title                 "Change title of window based on file
set ttyfast               "Smoother display for fast terminals
set nocompatible          "Get all of vim's awesomeness
syntax on                 "syntax highlighting

" see more of autocomplete
set wildmenu
set wildmode=longest,list,full

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ensure :E works as vim rails causes conflicts
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>

" set contents of statusline
set statusline=
set statusline+=%f "file
set statusline+=%m "file modified?
set statusline+=%r "readonly flag
set statusline+=%= "right align
set statusline+=%P "percentage

" set colouring of statusline
hi statusline term=bold,reverse cterm=bold,reverse gui=bold,reverse ctermfg=2

" always show status line
set laststatus=2

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-l>'
let g:ctrlp_cmd = 'CtrlPMixed'

au FileType gitcommit set tw=72

" macro for smart quotes replacement
let @l=":%s/’/'/g"
