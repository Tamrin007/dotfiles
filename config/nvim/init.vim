" Vi互換モードを無効化
set nocompatible

" ファイルタイプの判別を有効化
filetype indent plugin on

" シンタックスハイライトを有効化
syntax on

" TrueColor を ON
if has('patch-7.4.1778')
  set guicolors
endif
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" バッファを保持しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完をよしなに
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示
set hlsearch

" モードラインを無効化
set nomodeline

" 検索時に大文字・小文字を区別しない
set ignorecase

" 検索語に大文字・小文字が混在している場合は区別して検索
set smartcase

" オートインデントを有効化
set autoindent

" 移動コマンドを使用後、行頭に移動しない
set nostartofline

" 画面最下行にルーラを表示
set ruler

" ステータスラインを常に表示
set laststatus=2

" バッファが変更されている時、保存するかどうか確認
set confirm

" ビープ音の代わりにビジュアルベルを使用し、それを無効化
set visualbell
set t_vb=

" マウス有効化
set mouse=a

" コマンドラインの高さを2行にする
set cmdheight=2

" 行番号の表示
set number

" 行をハイライト
set cursorline

" <F10> で 'paste' と 'nopaste' を切り替える
set pastetoggle=<F10>

" タブ文字をスペース4個に
set shiftwidth=4
set softtabstop=4
set expandtab

" 'Y' を 'yy' と同じ動作に
map Y y$

" <C_L> で検索後の強調表示を解除
nnoremap <C-L> :nohl<CR><C-L>

" md の折りたたみを無効化
let g:vim_markdown_folding_disabled=1

" プラグイン
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'
Plug 'itchyny/lightline.vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'trusktr/seti.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'fatih/vim-go'
call plug#end()

" colorscheme
if isdirectory(expand("~/.config/nvim/plugged/seti.vim/"))
    colorscheme seti
else
    colorscheme desert
endif

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" depelete
let g:deoplete#enable_at_startup = 1

" Markdown プレビューのための設定
au BufRead, BufNewFile *.md set filetype=markdown

" カーソルラインのハイライトをクリア
hi clear CursorLine

