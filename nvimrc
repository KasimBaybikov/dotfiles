"default
set nu
syntax on
set nowrap

"extractable tabs and spaces
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

"tabs
set tabstop=4
set shiftwidth=4
"do not create swp files
set noswapfile
"scroll offset
set so=5
"Horizontal scroll offset
set siso=10

"fast move between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"bracket completion
inoremap {<CR> <space>{<CR>}<Esc>O
inoremap " ""<Esc>i
"inoremap [ []<Esc>i

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "`GoInstallBinaries при первом старте
Plug 'hashivim/vim-terraform'

"Plug 'safv12/andromeda.vim'

call plug#end()

"theme
"set termguicolors
"set background=dark

colorscheme purify

"colorscheme aurora

"Coc
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"go definition
nmap <silent> gd <Plug>(coc-definition)
nmap gb <C-o>

"let g:go_gopls_enabled = 0
"rename
nmap <leader>rn <Plug>(coc-rename)

"nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50

"nerdcommenter
vmap // <plug>NERDCommenterToggle
nmap // <plug>NERDCommenterToggle

"open terminal
noremap <F12> :bo :tabnew<CR>:terminal<CR>i
tnoremap <ESC> <C-\><C-n>

"copy in system buffer
vmap <C-y> "+y
