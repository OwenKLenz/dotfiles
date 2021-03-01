" Auto install Vim-Plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug '907th/vim-auto-save'
  Plug 'edkolev/tmuxline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'alvan/vim-closetag'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'steven-liou/console-puts'
  Plug 'metakirby5/codi.vim'
call plug#end()

let g:snipMate = { 'snippet_version' : 1 }

colorscheme gruvbox
set bg=dark

" Line numbers
set number
set relativenumber

" Lets you backspace past the point where you activated insert mode
set backspace=indent,eol,start

" Allows case insensitive searching. Will perform case sensitive search when capital letters are used.
set ignorecase
set smartcase

" Searchs are performed actively as you type
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Set tabs to two spaces
set expandtab " Insert spaces instead of tabs

set smarttab " forces use of shiftwidth and tabstop

set shiftwidth=2 " Change the number of spaces inserted for indentation

set tabstop=2 " Tabs insert 4 spaces

" Maintain indentation
set smartindent
set autoindent

" allow windows clipboard copying
set clipboard=unnamed

" :sp command opens new window on right side of screen
set splitright

" Set highlight all search results at once
set hlsearch
" Clear highlighted search results with enter
nnoremap <CR> :noh<CR><CR>

" Map 0 to jump to the beginning of any text on the current line
map 0 ^

" Allow intuitive navigation through wrapped lines
nmap j gj
nmap k gk

" WSL yank support to windows clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" Set paste mode toggle. Required to prevent indentation issues when pasting to vim from windows clipboard
set pastetoggle=<insert>

" Enable vim-auto-save by default
let g:auto_save = 1

" Change cursor display in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Search into subfolders
" Provide tab autocompletion for all file related tasks
set path+=**

" Deactivate autocommenting newlines following a previously commented line
autocmd FileType * set formatoptions-=cro

" Allow colorscheme to work in tmux (on WSL anyway)
set background=dark
set t_Co=256

"line wrapping doesn't occur mid word
set lbr

"Set number of lines below/above top/bottom of page at which to start scrolling the view window
set scrolloff=3

" Use <leader>r to run files
autocmd Filetype ruby nnoremap <leader>r :!ruby %:p<CR>
autocmd Filetype go nnoremap <leader>r :!go run %:p<CR>
autocmd Filetype javascript nnoremap <leader>r :!node %:p<CR>

"Surround a word with a new character pair. ie: \s( surrounds word with ()
nmap <leader>s ysiw

"Autoindent everything and return to where you left off
nmap <leader>= gg=G<C-o><C-o>

"Using steven-liou/console-puts plugin, shortcut for logging a value on one line (Ruby, JS, Python and Go only)
nmap <leader>l cp0j
