" ====================== 
" PLUGINS 
" ======================
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdcommenter'
Plug 'gruvbox-community/gruvbox'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jwalton512/vim-blade'
Plug 'evidens/vim-twig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}

call plug#end()

" ====================== 
" GLOBALS 
" ======================
" Theme stuff here
set t_Co=256
set t_ut=
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" Configs
set nocompatible
filetype indent plugin on
syntax on " enable syntax processing
set nobackup
set noswapfile " prevent vim from making .swp files
set undodir=~/.vim/undodir
set undofile
set incsearch  " Incremented search
set shiftwidth=2 " number of spaces for each indent step
set tabstop=2 softtabstop=2 " number of visual spaces of tab character
set expandtab " convert tab to spaces
set showmatch " highlight matching brackets and parentheses
set autoindent " enable auto indent
set colorcolumn=100 " set character limit per line
set splitright " Split horizontally in right direction
set splitbelow " Split verticall in bottom direction
set nrformats= " Treat all numerals as decimal
set noro " Default to not read-only in vimdiff
set diffopt+=iwhite " avoid whitespace comparison when diffing files
set backspace=indent,eol,start " to make backspacing work
set laststatus=2

" ====================== 
" DISPLAY 
" ======================
set hidden
set enc=utf-8
set cursorline " visually highlight current line
set relativenumber " show relative line numbers
set number " show line numbers (hybrid line numbers when paired with relativenumber option)
set wildmenu " Display all matching files on tab complete
set colorcolumn=80 " set a line guide to limit 80 characters per line
hi Normal guibg=NONE ctermbg=NONE
let g:netrw_liststyle = 3 " default to tree stucture

" ====================== 
" KEY REMAPPING 
" ======================
let mapleader = " "
set pastetoggle=<F10>
nnoremap <C-k> :Ex<CR>
nnoremap <leader>ts :set hlsearch!<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Move to the middle of the current line with respect to its line length
nnoremap <expr> gM (virtcol('$') / 2) . '<Bar>'
xnoremap <expr> gM (virtcol('$') / 2) . '<Bar>'

" ====================== 
" PLUGINS SPECIFIC CONFIGS
" ======================
" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>s :CocSearch<Space>
nmap <leader>c :CocCommand<CR>
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" DART/FLUTTER
let g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': '', 'NextReference': ''}
let g:dart_style_guide = 2
let g:flutter_show_log_on_run = 0 " Disable flutter logging on seperate window

" JS
let g:vim_jsx_pretty_highlight_close_tag = 1

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

" FUGITIVE
nmap <leader>gs :G<bar> :only<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>fgi :GFiles<CR>
nnoremap <leader>fgs :GFiles?<CR>

" JSDOC
nmap <silent> <C-l> <Plug>(jsdoc)

" NERDCOMMENTER
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
