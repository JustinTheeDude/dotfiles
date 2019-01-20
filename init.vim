" Required:
call plug#begin(expand('~/.vim/plugged'))
"*****************************************************************************
"" Vim Plugs
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'Xuyuanp/nerdtree-git-plugin'


""HTML || CSS/Frontend Plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'

""Javascript Plugins
Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }

"Ayu Theme
Plug 'drewtempelmeyer/palenight.vim'

"Linting
Plug 'w0rp/ale'

""Show line indents
Plug 'Yggdroot/indentLine'

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
" Fold Settings
"*****************************************************************************
" set foldmethod=syntax
" set foldlevelstart=99
" set foldnestmax=10
" set nofoldenable
" set foldlevel=1

"*****************************************************************************
" Ale Settings
"*****************************************************************************
let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'
let g:ale_completion_enabled = 1

let g:ale_linters = {
			\   'javascript': ['eslint', 'tsserver'],
			\   'typescript': ['tsserver', 'tslint'],
			\   'typescript.tsx': ['tsserver', 'tslint'],
			\   'html': []
			\}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 0
nmap <silent><leader>af :ALEFix<cr>

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

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

""Auto Complete Brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O}}}])'"

""Colors
set background=dark
set termguicolors
colorscheme palenight

let g:palenight_terminal_italics = 1

""Set backspace at all times
set backspace=indent,eol,start

""Autoindent dem lines
set autoindent

""Show matching braces
set showmatch

""Set terminal title
set title

""Show indented lines
set listchars=tab:▸\ ,eol:¬

set noshowcmd

"*****************************************************************************
"" NERDTree configuration
"*****************************************************************************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 10
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"*****************************************************************************
"" Save/Q shortcut
"*****************************************************************************
nmap <leader>w :w <CR>
nmap <leader>q :q <CR>
nmap <leader>e :wq <CR>

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
set splitbelow
set splitright

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
""Lightline Settings
"*****************************************************************************
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'palenight',
    \ }
set laststatus=2

"*****************************************************************************
""Switch between vim windows
"*****************************************************************************
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
