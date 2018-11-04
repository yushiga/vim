"文字コード
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
"全角文字の記号崩れ防止
set ambiwidth=double
"マウス有効（トラックパッドでスクロースも動確済み）
set mouse=a
"色
set t_Co=256
"行番号表示
set nu
"shit + Gで最終行の末尾へ
nnoremap G G$
"行末から次の行へ左右で移動できるようにする
set whichwrap=b,s,h,l,<,>,[,],~
"現在の行を強調表示
set cursorline
"現在の行を強調表示（縦）
set cursorcolumn
"ステータスラインを常に表示
set laststatus=2
"タブは半角スペース4文字
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround
"ヤンクした文字をクリップボードにコピー
set clipboard=unnamed
"検索文字をハイライト
set hls
"バックアップファイルを作らない
set nobackup
"スワップファイルを作らない
set noswapfile
"編集中のファイルが変更されたら自動で読み直す
set autoread
"バッファが編集中でもその他のファイルを開けるように
set hidden
"入力中のコマンドをステータスに表示する
set showcmd
"ノーマルモードでスペースキー2回押しでカーソル下の単語をハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
"削除時にヤンクしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap dd "_dd
"選択中のバッファを削除
nnoremap <C-P> :bd<CR>
"置換
nnoremap <C-Q> :%s///g

"-------------------------------------
" dein
"-------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
"↑↑↑↑↑↑↑↑↑↑↑↑↑↑ deinここまで

filetype plugin indent on
set background=dark
colorscheme badwolf
syntax on

"-------------------------------------
"ctags
"-------------------------------------
nnoremap <C-]> g<C-]>

"-------------------------------------
"powerline font
"-------------------------------------
let g:airline_powerline_fonts = 1
