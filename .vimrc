set nocompatible              " be improved, required
" Ben Frain @benfrain .vimrc
" Vundle settings {{{
	filetype off                  " required
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
	" Plugin 'scrooloose/nerdtree'
	Plugin 'bling/vim-airline'
	Plugin 'NLKNguyen/papercolor-theme'
	" Plugin 'Lokaltog/vim-easymotion'
	Plugin 'Raimondi/delimitMate'
	Plugin 'mattn/emmet-vim'
	Plugin 'kien/ctrlp.vim'
	" Plugin 'cakebaker/scss-syntax.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-commentary'
	Plugin 'nelstrom/vim-visual-star-search'
	Plugin 'moll/vim-bbye'
	Plugin 'jaywilliams/vim-vwilight'
	Plugin 'gorodinskiy/vim-coloresque'
	Plugin 'rking/ag.vim'
	" Plugin 'Valloric/YouCompleteMe'
	" Track the engine.
	Plugin 'SirVer/ultisnips'
	Plugin 'benfrain/vim-fidget'
	" Snippets are separated from the engine. Add this if you want them:
	Plugin 'honza/vim-snippets'
	Plugin 'vim-airline/vim-airline-themes'

	inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	imap <expr><CR> pumvisible() ? "\<C-n>" : "<Plug>delimitMateCR"
	" Finally, trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

	let g:UltiSnipsExpandTrigger="<C-C>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:ycm_collect_identifiers_from_comments_and_strings = 1
	let g:ycm_seed_identifiers_with_syntax = 1
	" let g:ycm_key_invoke_completion = '<C-Space>'
	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"

	" All of your Plugins must be added before the following line
	call vundle#end()            " required

	autocmd BufWritePost .vimrc source %
	inoremap jj <Esc>
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList          - list configured plugins
	" :PluginInstall(!)    - install (update) plugins
	" :PluginSearch(!) foo - search (or refresh cache first) for foo
	" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
	" }}}

" Character encoding {{{
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif
" }}}

" Line/Selection bubbling {{{
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" }}}

" Define what a keyword break is {{{
	setl iskeyword=@,48-57,192-255,%,#
	" }}}

" Set the leader {{{
" Set the leader to comma **** Don't move this as mappings defined before it
" will use the stadard leader (\).
let mapleader=","
" }}}

" Set up CTRL P {{{
" First set up patterns to ignore
set wildignore+=*/tmp/*,*.so,*/node_modules,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_map = '<c-p>'
" Open CTRL+P to search MRU (most recently used), files and buffers
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Make CTRL+P only look for filenames by default
let g:ctrlp_by_filename = '1'

"""""""""  CTRL+P Mappings """""""""
" Make CTRL+B open buffers
nnoremap <C-b> :CtrlPBuffer<CR>
" Make CTRL+F open Most Recently Used files
nnoremap <C-f> :CtrlPMRU<CR>
" }}}

" YankRing shortcut keys (CTRL+z) + (CTRL+x) {{{
let g:yankring_replace_n_pkey = '<C-z>'
let g:yankring_replace_n_nkey = '<C-x>'
" }}}

" Emmet controls {{{
let g:user_emmet_install_global = 0
" let g:user_emmet_expandabbr_key = '<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:use_emmet_complete_tag = 1
autocmd FileType html,css,scss,php EmmetInstall
" }}}

" Backup and locations {{{
" Set backup file location so swp files aren't saved to Git (make sure you
" create this folder first!!)
" set backup
" set backupdir=~/Vim-SWP-files
" set directory=~/Vim-SWP-files " Don't clutter my dirs up with swp and tmp files
" set writebackup
set noswapfile
set nobackup
" }}}

" Hightlight spaces and tabs {{{
" Highlight redundant whitespaces and tabs. Only shows trailing whitespace :)
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$/
" }}}

" Use Silver Searcher instead of grep {{{
" set grepprg=ag
" }}}

" Fuzzy finder ignore files {{{
" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;"
" }}}

" Set Syntastic checkers {{{
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" let g:syntastic_html_tidy_ignore_errors = [ 'discarding unexpected </a>' ]
" let g:syntastic_html_tidy_ignore_errors = [ 'missing </a> before <div>' ]
" let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty <span>' ]
"let g:syntastic_html_tidy_exec='~/tidy-html5/bin/tidy'
" let g:syntastic_html_checkers = ['w3']
"let g:syntastic_debug = 3
"let g:syntastic_html_validator_parser = ['html5']
" }}}

" HTML tag indentation settings {{{
" Make HTML get indented on the correct tags
let g:html_indent_inctags = "html,body,head,tbody,span,b,a,div"
" }}}

" Shortcut to indent whole file {{{
" indent the whole file and return to original position
nmap ,= mzgg=G`zz
" }}}

" Quick Buffer switch mappings {{{
" The idea is to press <leader> and then the number from normal mode to switch
" e.g. `,2` would switch to the second buffer (listed at the top of the
" airline strip

":nnoremap <silent> <Leader> :<C-u>try \| execute "b" . v:count \| catch \| endtry<CR>
for i in range(1, 99)
    execute printf('nnoremap <Leader>%d :%db<CR>', i, i)
endfor
for i in range(1, 99)
    execute printf('nnoremap <Leader>d%d :Bdelete %d<CR>', i, i)
endfor
" }}}

" Airline {{{
	" Make sure powerline fonts are used
	let g:airline_powerline_fonts = 1
	if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
	endif
	let g:airline_symbols.space = "\ua0"
	" let g:airline_theme="molokai"
	let g:airline_theme="papercolor"
	let g:airline#extensions#tabline#enabled = 1 "enable the tabline
	let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename of buffers in the tab line
	let g:airline_detect_modified=1
	let g:airline#extensions#bufferline#enabled = 1
	let g:airline#extensions#tabline#buffer_nr_show = 1
	" }}}

" NERDtree settings {{{
" Enable Nerdtree with CTRL + N
map <C-n> :NERDTreeToggle<CR>
" Set this to close Vim if NERDTree is the only open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Supertab settings {{{
let g:SuperTabLongestHighlight = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingBackward = '<F2>'
" }}}

" Function to trim trailing whitespace on save {{{
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

"autocmd BufWritePre *.vimrc *.html *.scss *.js :call TrimWhiteSpace()
autocmd FileType html,vimrc,scss,css,js autocmd BufWritePre <buffer> :call TrimWhiteSpace()
" }}}

" Disable arrow keys (hardcore) {{{
" map  <up>    <nop>
" imap <up>    <nop>
" map  <down>  <nop>
" imap <down>  <nop>
" map  <left>  <nop>
" imap <left>  <nop>
" map  <right> <nop>
" Some visual niceties
" }}}

" Syntax highlighting with Solarized {{{
" (requires correct presets for iTerm2/Terminal too:  http://blog.pangyanhan.com/posts/2013-12-13-vim-install-solarized-on-mac-os-x.html)
syntax enable
set background=dark
" colorscheme solarized
colorscheme vwilight

" Set pop menu
highlight Pmenu ctermbg=238 ctermfg=220
" }}}

" Standard Vim settings {{{
	set showcmd
	set showmode
	set title
	set number
	set relativenumber
	set ruler
	set cursorline
	"set showbreak=2026
	set laststatus=2 " Enable the status bar to always show
	"au BufRead,BufNewFile *.scss set filetype=css " Set extra filetypes
	au BufRead,BufNewFile *.md set filetype=markdown " Set extra filetypes
	set hidden " Set hidden to allow buffers to be browsed
	" filetype indent on
	" set smartindent
	set breakindent " Make word wrapping behave like it does in every other sane text editor
	set hlsearch " Highlight search results
	set incsearch " Make search jump:
	" Amazing custom search command. Thansk to Ingo: http://stackoverflow.com/a/24818933/1147859
	" command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
	set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
	set autoread " Make Vim automatically open changed files (e.g. changed after a Git commit)
	au FocusGained,BufEnter * :silent! !

	set backspace=indent,eol,start " allow backspacing over everything in insert mode
	set autoindent " always set autoindenting on
	set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
	set ttimeout " (Hopefully) removes the delay when hitting esc in insert mode
	set ttimeoutlen=1 " (Hopefully) removes the delay when hitting esc in insert mode
	"set list
	"set listchars=tab:┊\
	set tabstop=4 " The default is 8 which is MASSIVE!!
	set wildmenu " visually autocomplete the command menu
	set lazyredraw " only redraw when needed
	set ttyfast " sends more characters to the screen for fast terminal connections
	set showmatch " highlight matching [{()}]
	set foldenable " enable folding
	set foldlevelstart=10 " open most folds by default
	set foldnestmax=10 " 10 nested folders max
	set shiftwidth=4
	set wrap linebreak nolist
	set spell
	set virtualedit=onemore
	set smartcase "don't ignore Captials when present
	set ignorecase "don't need correct case when searching
	set splitbelow " puts new splits to the bottom
	set splitright " ensures new splits are to the right of current

	set t_Co=256   " This is may or may not needed.
	set background=light
	colorscheme PaperColor
	" Change Working Directory to that of the current file
	cmap cwd lcd %:p:h
	cmap cd. lcd %:p:h
	" }}}

" Quick Save, Quick Vimrc edit, open/close folds {{{
" open/close folds with space
nnoremap <space> za
" type `,ev` to edit the Vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" type `,s` to save the buffers etc. Reopen where you were with Vim with `vim
" -S`
nnoremap <leader>s :mksession!<CR>
" }}}

" Couple of CSS niteties {{{
" " Insert a line above the current set of property/declarations
nnoremap <leader>t vipo<ESC>o
" Insert a line below the current set of property/declarations
nnoremap <leader>b vip<ESC>O
" See: http://blog.millermedeiros.com/vim-css-complete/
" Make selection of CSS declaration
nnoremap <leader>A vip
" Make inner selection of nested CSS easy
nnoremap <leader>a vaBV
" }}}

" Few helper mappings {{{
" Disable K looking stuff up
map K <Nop>
" Allow CTRL+O to create a blank line above in Command mode
map <C-o> m`O<ESC>
" nnoremap p "+p
" map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
" Prevent Paste loosing the register source:
" http://stackoverflow.com/a/7797434/1147859
xnoremap p pgvy
" }}}

" Windows managment shortcuts {{{
" Make it possible to switch to left pane with ,z
:nmap <Leader>z <C-w>h
" Switch to right pane with ,x
:nmap <Leader>x <C-w>l

"" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>
" }}}

" Search with funky characters with :SS {{{
" Allow for searching of slashes and special characters with SS command
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')
" }}}

" Allow line movement on wraps with CTRL+usual {{{
vmap <C-j> gj
vmap <C-k> gk
vmap <C-h> g$
vmap <C-6> g^
vmap <C-0> g^
nmap <C-j> gj
nmap <C-k> gk
nmap <C-4> g$
nmap <C-6> g^
nmap <C-0> g^
" }}}

" Allow mouse scrolling in iTerm2 {{{
set mouse=a
" }}}

" Foldable settings {{{
	set modelines=1
	" }}}

" Scroll context {{{
set scrolloff=5
" }}}

" And allow paste in visual to not update register {{{
vnoremap p "_dP
" }}}

" Turn off highlighted search with <space> {{{
map <Space> :noh<cr>
" }}}

" Paste from normal mode onto new line {{{
" nmap p :pu<CR>
" }}}

" Let the Silver Searcher take over from Ack {{{
" let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}

"" Remember cursor position {{{
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" }}}

" Send shizzle to the black hole {{{
nnoremap <Leader>d V"_d
vnoremap <Leader>d "_d
" }}}

" Ignore the node_modules folder for searches {{{
set wildignore+=**/node_modules/**
" }}}

" Set clipboard {{{
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
" }}}

" Highlight current line number {{{
hi CursorLineNR cterm=bold ctermfg=220
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=220
augroup END
" }}}

" Gui Font settings {{{
set guifont=Sauce\ Code\ Powerline:h14
" Make the background easier to see in Gui Vim
if has("gui_running")
	highlight Pmenu guibg=#aaaaaa guifg=#333333 gui=bold
endif

" }}}

" Ag setup Silver Searcher {{{
let g:agprg="<custom-ag-path-goes-here> --column"
"}}}

" Easy motion mappings {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <Leader>w <Plug>(easymotion-bd-w)
" }}}

" delimitMate configuration {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
" }}}
" Function to show total amount of lines in the airline {{{
function! AirlineInit()
    let g:airline_section_z = airline#section#create_right(['%L'])
  endfunction
  autocmd VimEnter * call AirlineInit()
" }}}

set nocompatible              " be improved, required
" vim:foldmethod=marker:foldlevel=0
