" Required:
call plug#begin(expand('~/.vim/plugged'))
"*****************************************************************************
"" Vim Plugs
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sensible'

"HTML || CSS/Frontend Plugins Plug 'hail2u/vim-css3-syntax' Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'lepture/vim-jinja'

"" Match Tags
Plug 'gregsexton/MatchTag'

"Themes
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'aonemd/kuroi.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'reedes/vim-colors-pencil'

"Vim Surround
Plug 'tpope/vim-surround'

""Linting
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-gitgutter' "Auto complete brackets
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'
Plug 'ryanoasis/vim-devicons'


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
let g:ale_fixers = ['javascript', 'prettier']
let g:ale_fixers = ['json', 'prettier']
let g:ale_fixers = ['css', 'prettier']
let g:ale_fixers = ['htmldjango', 'prettier']
let g:ale_fix_on_save = 0
nmap <silent><leader>af :ALEFix<cr>

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
set fileencodings=utf-8
set binary
set nobomb
set ttyfast

"*****************************************************************************
"" Set Relative Numbers
"*****************************************************************************
set relativenumber

"*****************************************************************************
"" Fold Settings
"*****************************************************************************
noremap <Leader>f :<C-u> set foldmethod=indent<CR>

"*****************************************************************************
"" Indent Lines
"*****************************************************************************
let g:indentLine_enabled = 1
let g:indentLine_char = '»»»»'

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set number
set cursorline

let no_buffers_menu=1

set mousemodel=popup
set guioptions=egmrti

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

""Colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set termguicolors
let ayucolor="mirage"
let base16colorspace=256
colorscheme base16-solarflare

""Set backspace at all times
set backspace=indent,eol,start

""Autoindent dem lines
set autoindent

""Show matching braces
set showmatch

""Set terminal title
set title

"Show indented lines
 set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
 set list

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
let g:NERDTreeWinSize = 25
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
"" Split
"*****************************************************************************
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
set splitbelow
set splitright

"*****************************************************************************
""Clean Search History
"*****************************************************************************
nnoremap <silent> <leader><space> :noh<cr>

"*****************************************************************************
""Lightline Settings
"*****************************************************************************
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.active = {
    \'left': [ [ 'mode', 'paste' ],
    \ [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
    \}

let g:lightline.tabline = {
            \ 'left': [[ 'vim_logo', 'tabs' ]]
            \}
let g:lightline.component = {
        \ 'vim_logo': "\ue7c5"
        \ }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be " }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba " }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#gitdiff#indicator_added = "\uf055 "
let g:lightline#gitdiff#indicator_deleted = "\uf057 "
let g:lightline#gitdiff#indicator_modified = "\uf056 "
set laststatus=2

"*****************************************************************************
""Switch between vim windows
"*****************************************************************************
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"*****************************************************************************
" Tab Settings
"*****************************************************************************
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set noswapfile

nnoremap K i<CR><Esc>

highlight clear LineNr
highlight clear SignColumn

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
