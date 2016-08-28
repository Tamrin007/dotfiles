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

" 日本語周りの設定
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        if has('mac')
            let &fileencodings = s:enc_jis .','. s:enc_euc
            let &fileencodings = &fileencodings .','. s:fileencodings_default
        else
            let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
            let &fileencodings = &fileencodings .','. s:fileencodings_default
        endif
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
endif

" プラグイン
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim'
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

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" depelete
let g:deoplete#enable_at_startup = 1

" Markdown プレビューのための設定
au BufRead, BufNewFile *.md set filetype=markdown

" カーソルラインのハイライトをクリア
hi clear CursorLine

