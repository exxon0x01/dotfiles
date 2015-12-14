if has('vim_starting')
	set nocompatible

	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		:call system("git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif

	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set number

set incsearch
set wildmenu wildmode=list:full

syntax on
set nohlsearch

setlocal path=.,/usr/include,$INCLUDE

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" plugins

"unite
NeoBundle 'Shougo/unite.vim'

"nerdtree
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent> <C-e> :<C-u>NERDTreeToggle<CR>

"vimproc
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }

"Neoinclude
NeoBundle 'Shougo/neoinclude.vim'

"ultisnips
NeoBundle 'SirVer/ultisnips'

"Neocomplete
NeoBundle 'Shogo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1

"Marching
NeoBundle "osyo-manga/vim-marching"
let g:marching_backend = "sync_clang_command"
let g:marching_clang_command_option="-std=c++1y"
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
  let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

NeoBundleCheck
call neobundle#end()

filetype plugin indent on
