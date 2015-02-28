if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" ======================================================================
" plugins
" ----------------------------------------------------------------------
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'Shougo/vimproc'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nishigori/increment-activator'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'othree/eregex.vim'

" colors
NeoBundle 'tpope/vim-vividchalk'

filetype plugin indent on
syntax on

" LeafCage/foldCC
" @see http://d.hatena.ne.jp/leafcage/20111223/1324705686
set foldtext=FoldCCtext()
set fillchars=vert:\|
let g:foldCCtext_tail = 'printf("   %s[%4d lines  Lv%-2d]%s",
    \ v:folddashes, v:foldend-v:foldstart+1, v:foldlevel, v:folddashes)'

" nathanaelkane/vim-indent-guides
let indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233
let g:indent_guides_enable_on_vim_startup = 1

" nishigori/increment-activator
let g:increment_activator_filetype_candidates = {
    \ '_' : [
    \ ],
    \ 'gitrebase': [
    \   ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec'],
    \ ],
    \ 'ruby.rspec': [
    \   ['it', 'xit'],
    \   ['get', 'post', 'put', 'delete'],
    \ ],
    \ }

" thinca/vim-quickrun
augroup QuickrunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  " @see http://qiita.com/joker1007/items/69035c454de416849b8a
  nnoremap <expr><silent> <Leader>lr "<Esc>:QuickRun -cmdopt \"-l " . line(".") . "\"<CR>"
augroup END
let g:quickrun_config = {}
let g:quickrun_config._ = { 'runner' : 'vimproc' }
let g:quickrun_config['ruby.rspec'] = {
    \ 'command' : 'rspec',
    \ 'exec' : 'bundle exec %c %o %s %a',
    \ 'split' : '',
    \ 'runner/vimproc/updatetime' : 10,
    \ }

" =====================================================================
" basic options
" ----------------------------------------------------------------------
set noswapfile
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
set scrolloff=5
set foldmethod=syntax
set foldlevel=99
set number
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:\
set ambiwidth=double
set fileencodings=utf-8,cp932,euc-jp
set fileformats=unix,dos,mac
set clipboard=unnamed
set wildmenu
set wildmode=list:longest
set backspace=start,indent
set display=lastline

" 表示行単位の移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

nnoremap Y y$

" window 移動
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

" folding
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
vnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
vnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" 検索後、真ん中にフォーカスをあわせる
nnoremap n  nzvzz
nnoremap N  Nzvzz

" テキストの整形方法(改行時の自動コメントアウト等)を調整
autocmd FileType * setlocal formatoptions=tcqnlmMj

" ======================================================================
" color
" ----------------------------------------------------------------------
set t_Co=256
colorscheme vividchalk
set background=dark
