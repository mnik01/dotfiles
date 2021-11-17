" mnik01 vim config 
" TODO: rename/refactor on f2
" BUG: Wrong keybinding CTRL+arrows delte lines.
" Map leader space. CTRL lagging at all. And shift key. It problem with tmux
" and vim integration 
let mapleader=" "

" -*- Plugins start -*-
" VimPlug. :PlugInstall
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
" -*- Plugins end -*-

" Colorsheme
colorscheme codedark



" -*- Settings start -*-
" Line numbers at left side
set number
set relativenumber

" Use spaces instead of tabs
set expandtab

set hidden

" Be smart when using tabkey
set smarttab

" 1 tab == 2 spaces 
set shiftwidth=2
set tabstop=2

filetype plugin on
filetype indent on

" Highlight matched parantheceses
set showmatch

" Incomplete cmd commands showing
set showcmd

" Reload on save doc from other process
set autoread

" Syntax highlighting
syntax enable

" Folding. By z key
set foldmethod=syntax
set foldlevel=99
nmap z za

" Searching settings
set ignorecase
set smartcase
set incsearch

" Always show status line
set laststatus=2

" Allow system clipboard
set clipboard=unnamed

" Split windows shortcuts
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Autocompletions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

" Prettier if it installed
if isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif


" Eslint if it installed
if isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" TODO: change inner `` add feature
" TODO: run prettier and linter on save file or on key binding
" TODO: on paratheses highlight remove
" Go to definition, type-definition, implementation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Apply code action
nmap <leader>ac <Plug>(coc-codeaction)
" Auto fix current line
nmap <leader>qf <Plug>(coc-fix-current)

" Format
nmap <leader>f :CocCommand prettier.formatFile<CR>

" Cursor solid vertical line
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"

" Fix coc floating error msg syntax highlight
hi CocErrorFloat guifg=Magenta guibg=Magenta


