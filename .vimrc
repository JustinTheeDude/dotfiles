" Required:
call plug#begin(expand('~/.vim/plugged'))
"*****************************************************************************
"" Vim Plugs
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

""HTML/Frontend Plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'mattn/emmet-vim'

""Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

""Vim Plug PlugEnd
call plug#end()

"*****************************************************************************
"" Leader Key
"*****************************************************************************
let mapleader=','

"*****************************************************************************
" Remove White Space on save
"*****************************************************************************
autocmd BufWritePre * :%s/\s\+$//e

"*****************************************************************************
" Tab Settings
"*****************************************************************************
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"*****************************************************************************
"" Search Settings
"*****************************************************************************
set hlsearch
set incsearch
set ignorecase
set smartcase

"*****************************************************************************
"" Encoding
"*****************************************************************************
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"*****************************************************************************
"" Set Relative Numbers
"*****************************************************************************
set relativenumber

"*****************************************************************************
"" Fold Settings
"*****************************************************************************
noremap <Leader>f :<C-u> set foldmethod=indent

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set ruler
set number

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

""Colors
set background=dark
set termguicolors
colorscheme dracula

"*****************************************************************************
"" NERDTree configuration
"*****************************************************************************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Split
"*****************************************************************************
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"*****************************************************************************
"" Syntastic Settings
"*****************************************************************************
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

"*****************************************************************************
""Clean Search History
"*****************************************************************************
nnoremap <silent> <leader><space> :noh<cr>

"*****************************************************************************
" vim-airlin
"*****************************************************************************
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='minimalist'

