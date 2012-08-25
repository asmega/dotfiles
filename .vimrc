call pathogen#infect()

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
