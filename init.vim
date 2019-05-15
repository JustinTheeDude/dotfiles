"*****************************************************************************
"       (`-.           _   .-')    _  .-')                  .-. .-')
"     _(OO  )_        ( '.( OO )_ ( \( -O )                 \  ( OO )
" ,--(_/   ,. \ ,-.-') ,--.   ,--.),------.   .-----.        ;-----.\  ,--.   ,--.
" \   \   /(__/ |  |OO)|   `.'   | |   /`. ' '  .--./        | .-.  |   \  `.'  /
"  \   \ /   /  |  |  \|         | |  /  | | |  |('-.        | '-' /_).-')     /
"   \   '   /,  |  |(_/|  |'.'|  | |  |_.' |/_) |OO  )       | .-. `.(OO  \   /
"    \     /__),|  |_.'|  |   |  | |  .  '.'||  |`-'|        | |  \  ||   /  /\_
"     \   /   (_|  |   |  |   |  | |  |\  \(_'  '--'\        | '--'  /`-./  /.__)
"      `-'      `--'   `--'   `--' `--' '--'  `-----'        `------'   `--'
"                         .-')    .-') _               .-') _        .-') _     ('-.        (`-.      ('-.    .-')
"                        ( OO ). (  OO) )             ( OO ) )      (  OO) )  _(  OO)     _(OO  )_  _(  OO)  ( OO ).
"      ,--. ,--. ,--.   (_)---\_)/     '._ ,-.-') ,--./ ,--,'       /     '._(,------.,--(_/   ,. \(,------.(_)---\_)
"  .-')| ,| |  | |  |   /    _ | |'--...__)|  |OO)|   \ |  |\       |'--...__)|  .---'\   \   /(__/ |  .---'/    _ |
" ( OO |(_| |  | | .-') \  :` `. '--.  .--'|  |  \|    \|  | )      '--.  .--'|  |     \   \ /   /  |  |    \  :` `.
" | `-'|  | |  |_|( OO ) '..`''.)   |  |   |  |(_/|  .     |/          |  |  (|  '--.   \   '   /, (|  '--.  '..`''.)
" ,--. |  | |  | | `-' /.-._)   \   |  |  ,|  |_.'|  |\    |           |  |   |  .--'    \     /__) |  .--' .-._)   \
" |  '-'  /('  '-'(_.-' \       /   |  | (_|  |   |  | \   |           |  |   |  `---.    \   /     |  `---.\       /
"  `-----'   `-----'     `-----'    `--'   `--'   `--'  `--'           `--'   `------'     `-'      `------' `-----'
"*****************************************************************************

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
Plug 'xolox/vim-misc'
Plug 'Xuyuanp/nerdtree-git-plugin'

""HTML || CSS/Frontend Plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'

"Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'sonph/onehalf'
Plug 'liuchengxu/space-vim-dark'
Plug 'sickill/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'KeitaNakamura/neodark.vim'

"Go Lang Plugins
Plug 'fatih/vim-go'

"Linting
Plug 'w0rp/ale'

"Lightline
Plug 'itchyny/vim-gitbranch'

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
noremap <Leader>f :<C-u> set foldmethod=indent <CR>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set ruler
set number

let no_buffers_menu=1

set mousemodel=popup
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
colorscheme tender
let g:onedark_termcolors=256

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""Palenight Settings
let g:palenight_terminal_italics = 1

""Set backspace at all times
set backspace=indent,eol,start

""Autoindent dem lines
set autoindent

""Show matching braces
set showmatch

""Set terminal title
set title

set noshowcmd

"*****************************************************************************
"" NERDTree configuration
"****************************************************************************
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
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
    \ }
set laststatus=2

"*****************************************************************************
""Switch between vim windows
"*****************************************************************************
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

nmap gf :BrianOpenFile<CR>

"*****************************************************************************
"Set Path
"*****************************************************************************
set path+=/Users/justin/aptstwofoseven/247/247/templates_frontend,

command! BrianOpenFile call BrianOpenFile()
function! BrianOpenFile()
    try
    let g:BrianOpenFileName = matchstr(expand("<cfile>"), ".*")
    "echo g:BrianOpenFileName
    execute ':find ' . g:BrianOpenFileName
    catch /.*/
        try
        let g:BrianOpenFileName = expand("<cfile>") . ".js"
        "echo g:BrianOpenFileName
        execute ':find ' . g:BrianOpenFileName
        catch /.*/
            try
            let g:BrianOpenFileName = tr(expand("<cfile>"), ".", "/") . ".py"
            execute ':find ' . g:BrianOpenFileName
            catch /.*/
                try
                let g:BrianOpenFileName = matchstr(expand("<cfile>"), "[^/].*")
                execute ':find ' . g:BrianOpenFileName
                catch /.*/
                endtry
            endtry
        endtry
    endtry
endfunction

"*****************************************************************************
" Tab Settings
"*****************************************************************************
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab

highlight clear SignColumn
