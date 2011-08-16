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

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
