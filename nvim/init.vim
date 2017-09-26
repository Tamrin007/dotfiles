"
"                 __
"  __          __/\ \__               __
" /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
" \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"  \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"   \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"    \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/
"

" vim-plug
let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vimplug_exists)
    echo "Installing vim-plug...\n"
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
endif

" Plugin list
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhartington/oceanic-next'
" Language
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
call plug#end()

" Plugin Settings
" NERDTree
" Show hidden files
let NERDTreeShowHidden = 1
" Close NERDTree when all buffers are closed
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert

" indentLine
let g:indentLine_color_term = 239

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_error_sign        = {'text': '>>', 'texthl': 'Error'}
let g:neomake_warning_sign      = {'text': '>>',  'texthl': 'Todo'}
let g:neomake_go_enabled_makers = ['golint', 'govet']
let g:neomake_javascript_enabled_makers = ['eslint']

" vim-go
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = "goimports"
let g:go_term_mode                   = "split"
let g:go_term_enabled                = 1

" General Settings
language message en_US
filetype plugin indent on
set fileformats=unix,dos,mac
set showcmd
set shell=$SHELL

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Tab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to <Space>
let mapleader = "\<Space>"

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" No backup, swap file
set nobackup
set noswapfile

" Dsable visual bell
set noerrorbells visualbell t_vb=

" Clipboard
set clipboard=unnamed,unnamedplus

" Mouse enable
set mouse=a

" Split right, below
set splitright
set splitbelow

" Visual settings
syntax on
set ruler
set number
set mousemodel=popup
if (has("termguicolors"))
 set termguicolors
endif
let no_buffers_nemu = 1
autocmd ColorScheme * highlight VertSplit ctermbg=234 ctermfg=234 guibg=#1A1A1A guifg=#1A1A1A
autocmd ColorScheme * highlight Error ctermbg=1 guibg=#EC5f67

" airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
set laststatus=2
let g:airline_theme='oceanicnext'

" Enable colorscheme
colorscheme OceanicNext

" Search mapings
nnoremap n nzzzv
nnoremap N Nzzzv

" Mappings
" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Moving operation
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Open file in current tab
noremap <Leader>e :e <C-r>=expand("%:p:h") . "/" <CR>

" Open file in new tab
noremap <Leader>te :tabe <C-r>=expand("%:p:h") . "/" <CR>

" Clipboard
if has('macunix')
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

" Clear searching highlight
nnoremap <silent> <Leader><Space> :noh<CR>

" Switch window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-go
autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>de <Plug>(go-def-split)
autocmd FileType go nmap <Leader>do <Plug>(go-doc-split)
autocmd FileType go nmap <Leader>dob <Plug>(go-doc-browser)

