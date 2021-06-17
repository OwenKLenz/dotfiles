" Auto install Vim-Plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug '907th/vim-auto-save'
  Plug 'edkolev/tmuxline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'alvan/vim-closetag'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'steven-liou/console-puts'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

	" Javascript plugins
  Plug 'sheerun/vim-polyglot'
call plug#end()

" Set color scheme
colorscheme gruvbox
set bg=dark

" Use line numbers
set number

" Allows backspacing past the point where insert mode was activated
set backspace=indent,eol,start

" Allows case insensitive searching. Will perform case sensitive search when capital letters are used.
set ignorecase
set smartcase

" Searches are performed actively as you type
set incsearch

" Set highlight all search results at once
set hlsearch

" Clear highlighted search results with enter
nnoremap <CR> :noh<CR><CR>

" Search into subfolders
" Provide tab autocompletion for all file related tasks
set path+=**


" Unbind Q from entering :Ex mode
nmap Q <Nop>

" Disable annoying audible bell
set noerrorbells visualbell t_vb=

" Tab and indent config
set expandtab " Insert spaces instead of tabs
set smarttab " forces use of shiftwidth and tabstop
set shiftwidth=2 " Change the number of spaces inserted for indentation
set tabstop=2 " Tabs insert 4 spaces
set smartindent
set autoindent

" Display 80 char line
set cc=80

" Intuitive split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Don't create swapfiles
set noswapfile

" Map 0 to jump to the beginning of any text on the current line
map 0 ^

" For intuitive navigation through wrapped lines
nmap j gj
nmap k gk

" WSL yank support to windows clipboard
set clipboard=unnamed
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" Set paste mode toggle. Prevents indentation issues when pasting to vim from Windows clipboard
set pastetoggle=<insert>

" Enable vim-auto-save by default
let g:auto_save = 1

" Change cursor display in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Deactivate autocommenting newlines following a previously commented line
autocmd FileType * set formatoptions-=cro

" Needed for colorscheme to work in tmux (on WSL anyway)
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

"Easy binding for autologging lines of code (steven-liou/console-puts plugin)
nmap <leader>l cp0j

"Save+quit remapping
nmap <leader>q :wq<CR>

" NERDTree config
nmap <leader>t :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf config
nmap <leader>f :GFiles<CR>

" Enable CoC jump to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
