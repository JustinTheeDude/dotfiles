call plug#begin(expand('~/.vim/plugged'))
"*****************************************************************************
""" Vim Plugs
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

"HTML || CSS/Frontend Plugins
Plug 'mattn/emmet-vim'
Plug 'lepture/vim-jinja'

""Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Match Tags
Plug 'gregsexton/MatchTag'
Plug 'sharkdp/bat'

"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'danilo-augusto/vim-afterglow'
Plug 'jacoborus/tender.vim'
Plug 'sjl/badwolf'

"Vim Surround
Plug 'tpope/vim-surround'

""Linting
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

Plug 'ruanyl/vim-gh-line'
Plug 'srstevenson/vim-picker'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"all da sets
syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitbelow
set splitright
set nohlsearch
set incsearch
set smartcase
set ignorecase
set encoding=utf-8
set fileencodings=utf-8
set noswapfile
set hidden
set relativenumber
set number
set cursorline
set lazyredraw
set si
set autoindent
set showmatch
set scrolloff=5
set colorcolumn=80
set nowrap

"*****************************************************************************
"" new file
"*****************************************************************************


"*****************************************************************************
"" brackets
"*****************************************************************************
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"*****************************************************************************
"" surround in function
"*****************************************************************************
nmap <Leader>r ysawf

"*****************************************************************************

"*****************************************************************************
"" Leader Key
"*****************************************************************************
let mapleader=','

"*****************************************************************************
"" COC
"*****************************************************************************
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--tab-width 4 --trailing-comma es5 --no-bracket-spacing false --print-width 120'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['sasslint'],
\   'vim': ['vint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'scss': ['prettier', 'stylelint'],
\}

let g:ale_fix_on_save = 1
nmap <silent><leader>af :ALEFix<cr>

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

let no_buffers_menu=1

set mousemodel=popup
set guioptions=egmrti

"" Disable the blinking cursor.
set gcr=a:blinkon0

""Colors
set termguicolors
colorscheme badwolf

""Set backspace at all times
set backspace=indent,eol,start

set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

set noshowcmd


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

"*****************************************************************************
""Clean Search History
"*****************************************************************************
nnoremap <silent> <leader><space> :noh<cr>

"*****************************************************************************
""Lightline Settings
"*****************************************************************************
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified' ]
      \           ],
      \   'right': [
      \     ['ale', 'fugitive'],
      \     ['lineinfo'],
      \     ['percent'],
      \     ['charcode', 'fileformat', 'filetype'],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'modified' ] ]
      \ },
      \ 'component': {
      \   'filename': '%f'
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'ale': 'ALEGetStatusLine'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\u2b64"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

set noshowmode
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
nnoremap K i<CR><Esc>
set t_Co=256
