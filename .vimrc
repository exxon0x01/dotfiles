"""NeoBundle Setting
"==================================================

""NeoBundleInstall
if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

""NeoBundle list
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kana/vim-submode'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/rainbow_parentheses.vim'
"lazy load
NeoBundleLazy 'vim-jp/cpp-vim', {'autoload' : {'filetypes' : ['c' , 'cpp']}}
NeoBundleLazy 'guns/vim-clojure-static', {'autoload' : {'filetypes' : 'clojure'}}
NeoBundleLazy 'tpope/vim-fireplace', {'autoload' : {'filetypes' : 'clojure'}}
NeoBundleLazy 'tpope/vim-classpath', {'autoload' : {'filetypes' : 'clojure'}}


NeoBundleCheck
call neobundle#end()

"==================================================



"""General Settings
"==================================================

""color scheme
set background=dark
if  neobundle#is_installed('vim-hybrid')
  colorscheme hybrid
endif

""enable syntax
syntax on
""hilight current line
set cursorline
""filetype detection
filetype plugin indent on
""use the OS clipboard by default
set clipboard=unnamed
""enable lines number
set number
""encode utf-8
set encoding=utf8
""file encode utf-8
set fileencoding=utf-8
""enable incrimental search
set incsearch
""enhance command-line completion
set wildmenu wildmode=list:full
""allow backspace in insert mode
set backspace=start,eol,indent
""make tabs as wide as two spaces
set tabstop=2
""set autoindent
set autoindent
""make tabs as spaces
set expandtab
set shiftwidth=2
""show the cursor position
set ruler
""show invisible characters
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
""don't create swap
set noswapfile
""don't create backup
set nobackup
""reload as file changed
set autoread
""enable mouse control
set mouse=a
""no beep
set visualbell t_vb=
set noerrorbells

""keymapping
let mapleader = ","
"move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"window & tab (with unite&submode)
"ref. http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
if neobundle#is_installed('vim-submode')
  call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
  call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
  call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
  call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
  call submode#map('bufmove', 'n', '', '>', '<C-w>>')
  call submode#map('bufmove', 'n', '', '<', '<C-w><')
  call submode#map('bufmove', 'n', '', '+', '<C-w>+')
  call submode#map('bufmove', 'n', '', '-', '<C-w>-')
endif

"==================================================



"""Plugin's settings
"==================================================

""unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
"show yank-history list
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
"show buffer list
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
"show current dirctory
nnoremap <silent> <Leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"show register list
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>

""vimshell
nnoremap <silent> <Leader>vs :VimShell<CR>

""nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

""neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#skip_auto_completion_time = ""
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_enable_camel_case_completion = 0
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

""neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

""caw
"comment-out
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
"uncomment-out
nmap <Leader>C <Plug>(caw:i:uncomment)
vmap <Leader>C <Plug>(caw:i:uncomment)

""quickhi
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

""quickrun
let g:quickrun_config = {
      \		"_" : {
      \				"outputter" : "error",
      \				"outputter/error/success" : "buffer",
      \				"outputter/error/error"   : "quickfix",
      \				"outputter/buffer/split" : ":botright 8sp",
      \				"outputter/quickfix/open_cmd" : "copen",
      \				"runner" : "vimproc",
      \				"runner/vimproc/updatetime" : 500,
      \		},
      \		"c" : {
      \				"type" : "c/gcc",
      \		},
      \		"cpp" : {
      \				"type" : "cpp/g++",
      \		},
      \		"python" : {
      \				"type" : "python"
      \		},
      \}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

""rainbow_parentheses
"ref. https://github.com/kien/rainbow_parentheses.vim
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
if neobundle#is_installed('rainbow_parentheses.vim')
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif

"==================================================
