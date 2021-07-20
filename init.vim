"             ( OO ) )       (  OO) )      _(OO  )_        ( '.( OO )_  
"  ,-.-') ,--./ ,--,' ,-.-') /     '._ ,--(_/   ,. \ ,-.-') ,--.   ,--.)
"  |  |OO)|   \ |  |\ |  |OO)|'--...__)\   \   /(__/ |  |OO)|   `.'   | 
"  |  |  \|    \|  | )|  |  \'--.  .--' \   \ /   /  |  |  \|         | 
"  |  |(_/|  .     |/ |  |(_/   |  |     \   '   /,  |  |(_/|  |'.'|  | 
" ,|  |_.'|  |\    | ,|  |_.'   |  |      \     /__),|  |_.'|  |   |  | 
"(_|  |   |  | \   |(_|  |      |  |.-.    \   /   (_|  |   |  |   |  | 
"  `--'   `--'  `--'  `--'      `--'`-'     `-'      `--'   `--'   `--' 
autocmd!

"""sets baby
set number
set relativenumber
set title
set tabstop=4
set shiftwidth=4
set lazyredraw
set background=dark
set nowrap
set noswapfile
set cursorline
set scrolloff=10
set encoding=utf-8
set nosc noru nosm
set ignorecase
set smarttab
set ai
set si
set backspace=start,eol,indent

""Indents
filetype plugin indent on

"""colorschemes
if exists("&termguicolors") && exists("&winblend")
	syntax enable
	set termguicolors
	set winblend=0
	set wildoptions=pum
	set winblend=0
	set wildoptions=pum
	set pumblend=5
	set background=dark
	colorscheme dracula_pro
endif

autocmd BufEnter * lua require'completion'.on_attach()

runtime ./plug.vim
runtime ./maps.vim
