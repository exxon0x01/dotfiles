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
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kana/vim-submode'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }
NeoBundle 'Shogo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle "tyru/caw.vim.git"
NeoBundle "t9md/vim-quickhl"
NeoBundleLazy 'vim-jp/cpp-vim', {'autoload' : {'filetypes' : ['c','cpp']}}

NeoBundleCheck
call neobundle#end()

"==================================================



"""General Settings
"==================================================

""color scheme
set background=dark
colorscheme hybrid

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
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

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

""nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

""neocomplete
if filereadable(expand("~/dotfiles/vim/neocomplete"))
  source ~/dotfiles/vim/neocomplete
endif

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

"==================================================
