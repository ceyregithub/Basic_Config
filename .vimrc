if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" source .vimrc from working directory and secure from any command in
" non-standard .vimrc
"set exrc
"set secure

set nobackup
set nowritebackup
set noswapfile
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set si          "Smart Indent
set wrap
set mouse=a
"set backup		" keep a backup file
set viminfo='20,%,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=700		" keep xx lines of command line history
set undolevels=700	" keep xx lines of undo levels.
set ruler		" show the cursor position all the time
set fdm=syntax		" Set folding method equal to syntax
set nu			" Show line numbers
set wildmenu
set wildignore+=*.o,*~,*.pyc
set magic
set showmatch
set switchbuf=usetab
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>
" kill the highlight
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

let mapleader = ","  " additional command keys prefaced by this key
" quit Vim current window
noremap <Leader>q :quit<CR>
" quit All Windows
noremap <Leader>Q :qa!<CR>
" update/write buffer to file (:w equivalent)
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

let &path.="~/ffmpeg/libavutil,~/ffmpeg/libavcodec,~/ffmpeg/libavformat,"
set includeexpr=substitute(v:fname,'\\.','/','g')

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" clang-format
let g:clang_format#code_style = "llvm" " llvm, google(default), chromium, mozilla
let g:clang_format#style_options = {
    \ "AccessModifierOffset" : -4,
    \ "AllowShortIfStatementsOnASingleLine" : "true",
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "Standard" : "Cpp11",
    \ "BreakBeforeBraces" : "Stroustrup",
	\ "IndentWidth" : 4,
	\ "TabWidth" : 4}
"g:clang_format#command = clang-format " location of clang-format
"g:clang_format#extra_args = ? " more options
"g:clang_format#detect_style_file = 1 " looks for .clang-format or _clang_format
"to apply styles
"g:clang_format#auto_format = 1 " auto format file on saving
" auto format when leaving Insert mode
let g:clang_format#auto_format_on_insert_leave = 1
"g:clang_format#auto_formatexpr = 1 "formatexpr set by vim-clang-format
let g:clang_complete_auto=1

" split movement keys remaped
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Move a line of text
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

if has("mac") || has ("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" When you press gv you vimgrep after selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>
" Open vimgrep and put the cursor in the right position
map <Leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" Vimgreps in the current file
map <Leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
" When you press <Leader>r you can search and replace the selected text
vnoremap <silent> <Leader>r :call VisualSelect('replace')<CR>
" When you search with vimgrep, display your results in cope by doing
map <Leader>cc :botright cope<CR>
" To go to the next search result do
map <Leader>cn :cn<CR>
" To go to the previous search results do
map <Leader>p :cp<CR>

"Show whitespace
" Must be inserted BEFORE the colorscheme command
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Pressing ,ss will toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<CR>
" Spelling shortcuts
map <Leader>sn ]s
map <Leader>sp [s
map <Leader>sa zg
map <Leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
" Quickly open a buffer for scripbble
map <Leader>e :e ~/buffer<CR>
" Toggle paste mode on and off
map <Leader>pp :setlocal paste!<CR>

" ex command for toggling hex mode - define mapping if desired
"command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
"function ToggleHex()
"	" hex mode should be considered a read-only operation
"	" save values for modified and read-only for restoration later,
"	" and clear the read-only flag for now
"	let l:modified=&mod
"	let l:oldreadonly=&readonly
"	let &readonly=0
"	let l:oldmodifiable=&modifiable
"	let &modifiable=1
"	if !exists("b:editHex") || !b:editHex
"		" save old options
"		let b:oldft=&ft
"		let b:oldbin=&bin
"		" set new options
"		setlocal binary " make sure it overrides any textwidth, etc.
"		let &ft="xxd"
"		" set status
"		let b:editHex=1
"		" switch to hex editor
"		%!xxd
"	else
"		" restore old options
"		let &ft=b:oldft
"		if !b:oldbin
"			setlocal nobinary
"		endif
"		" set status
"		let b:editHex=0
"		" return to normal editing
"		%!xxd -r
"	endif
"	" restore values for modified and read only state
"	let &mod=l:modified
"	let &readonly=l:oldreadonly
"	let &modifiable=l:oldmodifiable
"endfunction

" Only do this part when compiled with support for autocommands
"if has("autocmd")
" Enable file type detection.
"   " Use the default filetype settings, so that mail gets 'tw' set to 72,
"     " 'cindent' is on in C files, etc.
"       " Also load indent files, to automatically do language-dependent
"       indenting.
"         filetype plugin indent on
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 1
   syntax enable
   set hlsearch
"endif
augroup project
  autocmd!
  autocmd BufNewFile,BufRead *.pde setlocal ft=arduino
  autocmd BufNewFile,BufRead *.h,*.c set ft=c.doxygen
  autocmd BufWrite *.py :call DeleteTrailingWS()
  autocmd BufWrite * :call DeleteTrailingWS()
  autocmd FileType c,cc,cpp,h set cindent
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd Syntax * syn match ExtraWhitespace /\s\+$/
augroup END
set number
color RightSize

" if has("gui_running")
  set columns=140
  set lines=48
  set tw=80
  set colorcolumn=+1
"  if has("gui_gtk")
"    set guifont=Inconsolata:h24
"  elseif has("x11")
"    set guifont=Inconsolata:h24
""    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
"  else
    set guifont=Inconsolata\ for\ Powerline:h24
"  endif
"endif
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
"  let g:airline_left_sep = '»'
"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
"  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
"if &term=="xterm"
     set t_Co=256
     set t_AB=[48;5;%dm
     set t_AF=[38;5;%dm
     set t_Sb=[4%dm
     set t_Sf=[3%dm
"endif
" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"Visual Mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Pathogen to manage plugins
call pathogen#infect()

if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

":set cursorline
":set cursorcolumn

autocmd! bufwritepost .vimrc source %

set pastetoggle=<F2>
set clipboard=unnamed

" Make command
"set makeprg=make\ -C\ ../build\ -j9
" Run newly made program
"nnoremap <F5> :!./newly_minted_program<CR>

filetype on
filetype plugin indent on
let c_space_errors = 1
" Settings for Power Line (already existed, but powerline likes them too)
set laststatus=2

" Setting for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Helper Functions
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE '
  end
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")
  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif
  if bufnr("%") == l:currentBufNum
    new
  endif
  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction
" Settings for python-mode
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "view"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
set completeopt=menuone
"function! OmniPopup(action)
"  if pumvisible()
"    if a:action == 'j'
"      return "\<C-N>"
"    elseif a:action == 'k'
"      return "\<C-P>"
"    endif
"  endif
"  return a:action
"endfunction

"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

":set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
":set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
":set statusline=%m\ %f%r\ [%{&syntax},%{&fileformat}]%=x%02B\ %03l-%03c%V,%P
":set statusline=%y\ %f%00(\ %m%*%)%00(\ %r%*%)%00(\ %h%w%)\ %=%36([0x%B][O:0x%O][B:%n][L:%l/%L][C:%2c-%2v][%%:%p]%)
":set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%{VCSCommandGetStatusLine()}%=x%02B\ %-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %h%m%r%{VCSCommandGetStatusLine()}[%{&syntax},%{&fileformat}]%=x%02B\ %-14.(%l,%c%V%)\ %P
"
" Pascal specific settings
:let filetype_p = "pascal"
:let pascal_symbol_operator=1
:let pascal_gpc=1
:let pascal_one_line_strings=1
:let pascal_no_tabs=1

:filetype plugin on
:let g:C_AuthorName	= 'Clifton Eyre'
:let g:C_AuthorRef	= 'Research Scientist'
:let g:C_Email		= 'clifton.eyre@pnl.gov'
:let g:C_Company	= 'Pacific Northwest National Laboratory'
