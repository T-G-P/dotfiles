" Tobias Perelstein
"===================

" Heaviliy inspired by dougblack and amix. Big thanks to shougo for unite.vim
" CtrlP is configured as a backup for unite. Big thanks to kien for that
" awesome plugin

" https://gist.github.com/nongio/87af49b85ce898d3428e
" https://github.com/j1z0/vim-config/blob/master/vimrc
" https://github.com/johnhamelink/dotfiles/blob/master/nvim/init.vim
" https://github.com/dougblack/dotfiles/blob/master/.vimrc
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" Vundle {{{

" required for Vundle
set nocompatible

" required for Vundle
filetype off

" setting up vundle and add Vundle to runtime path

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/

" }}}

" Plugins {{{

" start Vundle
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

"search and file system related
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
" Plugin 'JazzCore/ctrlp-cmatcher'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Python sytax checker
Plugin 'vim-scripts/indentpython.vim'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Auto-completion stuff
Plugin 'Rip-Rip/clang_complete'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neoinclude.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'davidhalter/jedi-vim'

" Debugging
Plugin 'vim-scripts/Conque-GDB'

" Vim EasyMotion
Plugin 'easymotion/vim-easymotion'

" Tabular
Plugin 'godlygeek/tabular'

" Vim Surround
Plugin 'tpope/vim-surround'

" Vim Airline
Plugin 'vim-airline/vim-airline'

"Vim Tmux Navigator
Plugin 'christoomey/vim-tmux-navigator'

"Vim Repeat
Plugin 'tpope/vim-repeat'

"Matlab syntax highlighting
Plugin 'lazywei/vim-matlab'

" Python flake8 integration
Plugin 'nvie/vim-flake8'

" All work and no play makes Jack a dull boy
Plugin 'vim-scripts/TeTrIs.vim'


"...All other plugins...
if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" stop Vundle
call vundle#end()

" let plugins change indentation
filetype plugin indent on
filetype plugin on

" enable matching of tags
runtime macros/matchit.vim
" }}}

" Colors {{{
" enable syntax processing
syntax enable

set t_Co=256

try
    colorscheme Tomorrow-Night-Eighties
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set the highlight menu colors
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" }}}

" General {{{
set shell=/bin/bash

" faster redraw
set ttyfast

" Make backspace work how it should
set backspace=indent,eol,start

" Hide inactive buffers
set hidden

" Define leader key to be comma
let mapleader=","

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

let python_highlight_all=1

" For full syntax highlighting:
syntax on

" Allows yanking to the system clipboard
set clipboard=unnamedplus
" }}}

" Spaces & Tabs {{{

" 3 space tab
set tabstop=3

" use spaces for tabs
set expandtab

" 3 space tab
set softtabstop=3
set shiftwidth=3
set modelines=1
set autoindent
set smartindent
set cindent
set cino+=(0
set wrap

set list
set listchars=tab:>-
" }}}

" UI Layout {{{

" show line numbers
set number

" show command in bottom bar
set showcmd

" highlight current line
set nocursorline
set wildmenu

" higlight matching parenthesis
set showmatch

" Always show the status line
set laststatus=2

" }}}

" Visual Mode Related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
"}}}

" Searching Settings {{{

" ignore case when searching
set ignorecase

" search as characters are entered
set incsearch

" highlight all matches
set hlsearch

" Try to be smart about cases
set smartcase

" For regular expressions
set magic

" Set grep command to use ag
if executable('ag')
   set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ '*tags*'
endif

" }}}

" Custom Commands {{{

" Add custom Ag command that calls grep replaces existing Ag command if it exists
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Define a command to make it easier to use
command! -nargs=1 -bang Qfdo :call QFDo_each_line(<bang>0,<q-args>)

" }}}

" Folding {{{

" fold based on markers
set foldmethod=marker

" max 10 depth
" set foldnestmax=10

" don't fold files by default on open
set foldenable

"open and close folds with space
"nnoremap <space> za

" start with fold level of 10
" set foldlevelstart=10

" }}}

" Moving around, tabs, windows and buffers {{{
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Go to last accessed buffer
map <leader>bl :b#<cr>

map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Go to buffer by name or number
map <leader>bb :b<Space>

" List all buffers and provide quick way to open new buffer
map <leader>lsb :buffers<CR>:buffer<Space>

" List all buffers and provide quick way to vertically split new buffer
map <leader>lsv :buffers<CR>:vert sb<Space>

" List all buffers and provide quick way to easily delete buffer
map <leader>lsd :buffers<CR>:bd<Space>

" Vertically split by name or number
map <leader>vs :vert sb<Space>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Zoom pane from split
map <leader>z :on<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Opens a new buffer with the current buffer's path
map <leader>be :e <c-r>=expand("%:p:h")<cr>/

map <leader>ve :vsp <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remove file open in current buffer from the filesystem.
map <leader>rm !rm -f %:p:r %

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

map 0 ^
map E $
nnoremap gV `[v`]
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>


" When you press ga you Ag after the selected text
vnoremap <silent> ga :call VisualSelection('ga', '')<CR>
" When you press qf at a visual selection, can do a project wide find/replace
vnoremap <silent> qf :call VisualSelection('qf', '')<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" }}}

" Misc custom Mappings and Leader Shortcuts {{{
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>ms :mksession<CR>
"nnoremap <leader>ag :Ag
nnoremap <leader>1 :set number!<CR>
" nnoremap <leader>d :Make!
vnoremap <leader>y "+y
nnoremap <leader>sw :w !sudo tee %<CR>
"vmap v <Plug>(expand_region_expand)
"vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>
nnoremap <leader>dh d<HOME>

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

map <leader>ra :put =range(,)

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Grep word under cursor
"nnoremap <leader>ag :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>ag :Ag<SPACE>

vnoremap <leader>al !column -ts<Space>

" }}}

" Vim Airline{{{
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
" }}}

" NetRW{{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'
map <silent> <leader>w :call ToggleVExplorer()<CR>

" }}}

" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501,E111,E114'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_quiet_messages = {"regex": 'No such file or directory'}

nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
" }}}

" YouCompleteMe {{{
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_server_python_interpreter = 'python'
"
" "jump to declaration or definition
" nnoremap <leader>jd :YcmCompleter GoTo<CR>
" }}}

" NeoComplete and clang_complete{{{
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.5/lib'
let g:clang_jumpto_declaration_key = '<leader>jd'
let g:clang_user_options = '-std=c++11'

"" let g:clang_user_options="-std=c++0x"
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" "
" autocmd CompleteDone * pclose
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" }}}

" Tags {{{
set tags=./tags;,tags;

inoremap <c-x><c-]> <c-]>

let Gtags_Auto_Update = 1
" nnoremap <leader>jd :GtagsCursor<CR>

set csprg=gtags-cscope
" }}}

" Unite {{{

" Excluded directories for unite
call unite#custom_source('file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ '\.sass-cache/',
            \ 'bower_components/',
            \ 'dist/',
            \ 'venv/',
            \ 'node_modules/',
            \ '\.divshot-cache/',
            \ '\.svn/',
            \ '\.hg/',
            \ '\.bundle/',
            \ 'vendor/',
            \ 'tmp/',
            \ 'log/',
            \ '_build',
            \ 'deps'
            \ ], '\|'))


" Copying ctrlp functionality
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])



" Call these custom settings on all unite buffers:
autocmd FileType unite call s:unite_settings()

" unite grep using the_silver_searcher

if executable('ag')
    let g:unite_source_rec_async_command = ['ag', '--nocolor', '--nogroup', '-g', '.']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_oags = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_oag = ''
    let g:unite_source_grep_encoding = 'utf-8'
endif

let g:unite_source_history_yank_enable = 1

"View all buffers with unite
" nnoremap <space>b :Unite -quick-match buffer<cr>
nnoremap <space>b :Unite -start-insert buffer<cr>

"Scan the working directory like ctrlp
nnoremap <space>p :call Unite_ctrlp()<cr>

"Get the most recently used file list
nnoremap <space>mr :Unite -start-insert file_mru<cr>
"unite grep settings
"
"Search all files for text in current directory recursively
nnoremap <space>f :<C-u>Unite grep:.<cr>

"Search all files for text and specify directory path
nnoremap <space>F :<C-u>Unite grep<CR>

"Search all yank history
nnoremap <space>y :Unite history/yank<cr>

" For searching the word in the cursor in the current directory,
noremap <silent> <Leader>s :Unite grep:.::<C-R><C-w><CR>
" For searching the word in the cursor in the current buffer,
noremap <silent> <Leader>sf :Unite grep:%::<C-r><C-w><CR>
" For searching the word in the cursor in all opened buffers
noremap <silent> <Leader>sa :Unite grep:$buffers::<C-r><C-w><CR>


" }}}

" Jedi-Vim{{{
" let g:jedi#goto_command = "<leader>jg"
" let g:jedi#goto_assignments_command = "<leader>ja"
" let g:jedi#goto_definitions_command = "<leader>jd"
" let g:jedi#documentation_command = "<leader>k"
" let g:jedi#usages_command = "<leader>nu"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>rn"
" }}}

" Conque GDB{{{
" 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_Color = 2
" close conque when program ends running
let g:ConqueTerm_CloseOnEnd = 1
" display warning messages if conqueTerm is configured incorrectly
let g:ConqueTerm_StartMessages = 0
" }}}

" MacVim {{{
set guioptions-=r
set guioptions-=L
" }}}

" AutoGroups {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.json,*.txt,*.hs,*.java,*.md,*.rb,*.c,*.cpp,*.h,*.mk,Makefile,*.sh,Jenkinsfile*,.*rc :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2

    " Use UNIX (\n) line endings.
    au BufNewFile *.py,*.pyw,*.c,*.cpp,*.h set fileformat=unix

    " Make trailing whitespace be flagged as bad.
    autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

    " ------------Start Python PEP 8 stuff----------------
    " Number of spaces that a pre-existing tab is equal to.
    au BufRead,BufNewFile *py,*pyw set tabstop=4

    "spaces for indents
    au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
    au BufRead,BufNewFile *.py,*.pyw set expandtab
    au BufRead,BufNewFile *.py set softtabstop=4

    " Set the default file encoding to UTF-8:
    au BufEnter *.py set encoding=utf-8

    " Display tabs at the beginning of a line in Python mode as bad.
    au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

    " Wrap text after a certain number of characters
    au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

    " Keep indentation level from previous line:
    autocmd FileType python set autoindent

    "Folding based on indentation:
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set nofoldenable

    au BufReadPost Jenkinsfile* set syntax=groovy
    au BufReadPost Jenkinsfile* set filetype=groovy
augroup END
" }}}

" Backups {{{
" In case I want to use backups at some point
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" }}}

" Spell checking {{{

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>se zg
map <leader>s? z=
" }}}

" Mouse {{{
if has('mouse')
    set mouse=a
endif
" }}}

" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())

    if c ==# "b"
        let c = "("
    elseif c ==# "B"
        let c = "{"
    elseif c ==# "r"
        let c = "["
    endif

    exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" Build the ctrlp function, using projectroot to define the
" working directory.
function! Unite_ctrlp()
    execute ':Unite  -buffer-name=files file -start-insert file_rec/async'
endfunction

function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <buffer> <c-a> <Plug>(unite_choose_action)
    " Not showing the trailing space as red if has vim-trailing-color installed
    autocmd InsertLeave <buffer> match ExtraWhitespace //
    autocmd InsertEnter <buffer> match ExtraWhitespace //
    autocmd BufWinEnter <buffer> match ExtraWhitespace //
    " Other Customizations
    nnoremap <silent><buffer><expr> <C-x> unite#do_action('split')
    nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    nnoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'ga'
      if executable('ag')
        call CmdLine("Ag " . l:pattern ."<CR>" )
      else
        execute "grep -R " . l:pattern ." %:p:h"
        execute "cwindow"
      endif
    elseif a:direction == 'qf'
      if executable('ag')
        call CmdLine("Ag " . l:pattern ."<CR>" )
      else
        execute "grep -R " . l:pattern ." %:p:h <CR>"
        execute "cwindow"
      endif
      call CmdLine("Qfdo s" . '/'. l:pattern . '/')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
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

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

" https://github.com/karlbright/qfdo.vim/blob/master/plugin/qfdo.vim
function! QFDo_each_line(bang, command)
   try
      if a:bang
         silent lrewind
      else
         silent crewind
      endif
      while 1
         echo bufname("%") line(".")
         execute a:command
         if a:bang
            silent lnext
         else
            silent cnext
         endif
      endwhile
   catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/
   endtry
endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0
