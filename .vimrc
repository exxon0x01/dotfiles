" NeoBundleInstall
if has('vim_starting')
	set nocompatible

	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		:call system("git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif

	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"line number
set number

set incsearch
set wildmenu wildmode=list:full

"syntax
syntax on
colorscheme elflord

hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4

set nohlsearch

"include path
setlocal path=.,/usr/include,$INCLUDE

"move on i-mode
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


"Neocomplete
NeoBundle 'Shogo/neocomplete.vim'
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
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Neosnippet
NeoBundle "Shougo/neosnippet.vim"
NeoBundle 'Shougo/neosnippet-snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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
