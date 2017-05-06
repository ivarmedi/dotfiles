set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'rizzatti/dash.vim'
Plugin 'https://github.com/saltstack/salt-vim'
Plugin 'https://github.com/tpope/vim-fugitive/'
Plugin 'w0rp/ale'
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set number
set ts=2
set sw=2
set autoindent
set smartindent
set dictionary+=/usr/share/dict/words
set expandtab
set smarttab
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%][%{ALEGetStatusLine()}]
set backspace=indent,eol,start
set copyindent
set nowrap
set showmatch
set ignorecase
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set hlsearch

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>
syntax on

nnoremap j gj
nnoremap k gk
map <C-h> <C-w>h
map <C-l> <C-w>l
map <F3>  :Dash<CR>
" trim whitespaces
nmap <F4> :%s/\([ ]\+\)$//g<CR>``
nmap <F5> v:Gbrowse<CR>
vmap <F5> :Gbrowse<CR>

" ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
map <C-p> <Plug>(ale_previous_wrap)
map <C-n> <Plug>(ale_next_wrap)

" neovim
hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
set statusline=%-.100F\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y%r[%l,%v]%m
set statusline+=[%{ALEGetStatusLine()}]
set mouse=c

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
color dracula
