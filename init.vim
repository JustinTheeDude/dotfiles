" Required:
call plug#begin(expand('~/.vim/plugged'))
"*****************************************************************************
""" Vim Plugs
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

"HTML || CSS/Frontend Plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'lepture/vim-jinja'

"" Match Tags
Plug 'gregsexton/MatchTag'
Plug 'sharkdp/bat'

"Themes
Plug 'relastle/bluewery.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'

"Vim Surround
Plug 'tpope/vim-surround'

""Linting
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-gitgutter' "Auto complete brackets
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'

call plug#end()

"*****************************************************************************
""" fzf
"*****************************************************************************
command! -bang Buffer
  \ call fzf#vim#buffers({'down': '20%', 'options': '--reverse --margin 15%,0'}, <bang>0)
nmap <Leader>o :Buffer <cr>

"*****************************************************************************
"" Leader Key
"*****************************************************************************
let mapleader=','

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
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--tab-width 4 --trailing-comma es5 --no-bracket-spacing false --print-width 120'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['sasslint'],
\   'vim': ['vint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'scss': ['prettier', 'stylelint'],
\}

let g:ale_fix_on_save = 1
nmap <silent><leader>af :ALEFix<cr>

"*****************************************************************************
"" CSSComb
"*****************************************************************************
autocmd FileType scss,css nnoremap <buffer> <leader>c :call CSScomb()<CR>
function! CSScomb()
  execute "silent !csscomb " . expand('%')
  redraw!
endfunction

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
let base16colorspace=256
set termguicolors
colorscheme gruvbox

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
" Gruvbox
"*****************************************************************************
let g:gruvbox_italic = 0
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'soft'

"*****************************************************************************
"" NERDTree configuration
"*****************************************************************************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"*****************************************************************************
"" Save/Q shortcut
"*****************************************************************************
nmap <leader>w :w <CR>
nmap <leader>q :q <CR>
nmap <leader>wq :wq <CR>

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
set laststatus=2
let g:lightline = {
    \'colorscheme': 'gruvbox',
    \ 'active': {
    \'left': [ [ 'mode', 'paste' ],
    \ [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
    \},
    \ 'component_function': {
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \ }
    \ }


function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"*****************************************************************************
""Switch between vim windows
"*****************************************************************************
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"*****************************************************************************
" FZF
"*****************************************************************************
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \ 'rg
            \ --column
            \ --glob "*.{py,html}"
            \ --glob "!{.git,node_modules,.min.js}/*"
            \ --hidden
            \ --smart-case
            \ --line-number
            \ --no-heading
            \ --color=always '.shellescape(expand("<cword>")), 1,
            \ fzf#vim#with_preview(),
            \ <bang>0)
            \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
            \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
            \   <bang>0)

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

highlight NonText guifg=bg
