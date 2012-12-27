" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

runtime! debian.vim

" some useful plugins
call pathogen#infect()

"set background=dark

" jump to the last edit position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" enable filetype plugins
filetype plugin on
filetype indent on

"auto read when a file is changed from the outside
set autoread

" interface
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set lazyredraw
set magic
set showmatch
set mat=2
set number
set cursorline
"set cursorcolumn

" color and fonts
syntax on
"colorscheme desert
set encoding=utf8

" text, tab and indent related
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai 		 "auto indent
set si 		 "smart indent
set wrap	 "wrap lines
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"used to switch two program
function Refresh()
    call system("xdotool key \"alt+Tab\"")
    call system("xdotool key \"ctrl+r\"")
    call system("xdotool key \"alt+Tab\"")
endfunction

"used to open a browser
function OpenBrowser()
    let url=@%
    call system("python -m webbrowser -t ".url)
endfunction

" some usual mapping
map sv :w!<cr>
inoremap jk <esc>
imap <c-l> <c-y>,
map <c-k> <c-y>k
map rf :call Refresh()<cr> 
map <F6> :call OpenBrowser()<cr>


