""Leader Key
let mapleader=','

""Switch between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

""Clear Search History
nnoremap <silent> <leader><space> :noh<cr>

""Save and quit
nmap <leader>w :w <CR>
nmap <leader>q :q <CR>
nmap <leader>wq :wq <CR>

""Telescope
nnoremap <silent> <leader>f <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>r <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
