" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'

NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'hachibeeDI/python_hl_lvar.vim'
NeoBundle 'hynek/vim-python-pep8-indent'

NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'tyru/caw.vim.git'

NeoBundle 'davidhalter/jedi-vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
" NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
set shell=/bin/bash

noremap <C-j> <esc>
noremap! <C-j> <esc>

syntax enable
set background=dark
colorscheme molokai

set cmdheight=2
set showcmd
set laststatus=2
set smartcase
set hlsearch
set wildmenu
set autoindent
set smartindent
set backupdir=$HOME/.vim/backup
set shell=/bin/zsh
set clipboard=unnamed
set nocompatible
set directory=$HOME/.vim/backup
set expandtab
set shiftwidth=2
set tabstop=2
set whichwrap=b,s,h,l,<,>,[,]
set ruler
set showmatch
set hidden
set incsearch
set number
set smarttab
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
nnoremap <ESC><ESC> :nohlsearch<CR>
autocmd QuickFixCmdPost *grep* cwindow
set list
set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""


" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"""""""""""""""""""""""""""""""
" コメントアウト設定
"""""""""""""""""""""""""""""""
nmap <C-k> <Plug>(caw:i:toggle)
vmap <C-k> <Plug>(caw:i:toggle)
