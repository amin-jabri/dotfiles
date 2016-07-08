" vimrc based on Valloric's dotfiles, see:
" https://github.com/Valloric/dotfiles/tree/master/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                preamble                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible        " This Vi IMproved not vi

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to come before the configuration options for the plugins since
" vundle will add the plugin folders to the runtimepath only after it has seen
" the plugin's Plugin command.

Plugin 'Conque-GDB'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/ListToggle' "Toggle the quickfix and location lists display
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/xmledit'
Plugin 'VundleVim/Vundle.vim'
Plugin 'YankRing.vim'
Plugin 'a.vim'
Plugin 'aaronbieber/vim-quicktask'
Plugin 'altercation/vim-colors-solarized'
Plugin 'anyakichi/vim-surround' " Seems more active than tpope/vim-surround
Plugin 'bufkill.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-codefmtlib'
Plugin 'google/vim-glaive'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-syncopate'
Plugin 'greyblake/vim-preview' " call :Preview to open rendered in browser
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'helino/vim-json'
Plugin 'honza/vim-snippets'
Plugin 'jQuery'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/simple-javascript-indenter'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kien/ctrlp.vim'
Plugin 'ktonga/vim-follow-my-lead'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'matze/vim-move'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'oblitum/rainbow'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'othree/eregex.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'python.vim'
Plugin 'python_match.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rstacruz/sparkup.git', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown', {'name': 'vim-dev-markdown'}
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround', {'name': 'tpope-vim-surround'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-jp/cpp-vim'
Plugin 'wincent/command-t'
Plugin 'wordlist.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-session'
Plugin 'xu-cheng/brew.vim'

" non github repos: Plugin 'git://git.wincent.com/command-t.git'
" ...

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           pre-filetype tweaks                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" these are for the xmledit plugin
let xml_use_xhtml = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           reset vimrc augroup                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            General settings                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Home away from home. We store some config files and snippets here and the
" whole dotfiles dir is a git repo. Should be the last entry in rtp (for
" UltiSnips).
set rtp+=$HOME/dotfiles/vim

" vim shell initialization: expand_aliases
let $BASH_ENV="~/.aliases_bash.sh"

" We want our cross-machine spell file to be used
set spellfile=$HOME/dotfiles/vim/spell/en.utf-8.add

" TODO: transfer all our custom mapping to our vim_shortcuts file

" DISPLAY SETTINGS
colorscheme solarized   " sets the colorscheme
set background=light    " enable for light terminals
set showmatch           " show matching bracket (briefly jump) brackets/braces/parantheses
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set undofile            " stores undo state even when files are closed (in undodir)
set cursorline          " highlights the current line
set winaltkeys=no       " turns off the Alt key bindings to the gui menu

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu            " completion with menu
" This changes the default display of tab and CR chars in list mode
set listchars=tab:▸\ ,eol:¬
set nolist              " Disable list mode by default
" Characters to fill the statuslines and vertical separators
set fillchars+=stl:\ ,stlnc:\

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab

" popup menu and popup menu select colors
" highlight Pmenu ctermfg=<color> ctermbg=<color>
" highlight PmenuSel ctermfg=<color> ctermbg=<color>
highlight Pmenu ctermfg=Black ctermbg=White gui=bold
highlight PmenuSel ctermfg=White ctermbg=DarkGray gui=bold

set showtabline=2       " Always show the tabline even if we have only one tab

" EDITOR SETTINGS
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
" modifiers private, public and protected indented +1 space and lineup +1space
"set cino=+g1,+h1
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.
set noswapfile          " disable swap file

set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2        " spaces for autoindents
set softtabstop=2       " makes the spaces feel like real tabs
set shiftround          " makes indenting a multiple of shiftwidth
set expandtab           " turn a tab into spaces, unless using Ctrl-V<tab>
set laststatus=2        " the statusline is now always shown
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom
set number              " Display line numbers, use set nonumber to disable

" misc settings
set fileformat=unix     " file mode is unix
set fileformats=unix,mac,dos   " detects unix, dos, mac file formats in that order

set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo
                        " file -- 20 jump links, regs up to 500 lines'

set hidden              " allows making buffers hidden even with unsaved changes
set history=1000        " remember more commands and search history
set undolevels=1000     " use many levels of undo
set autoread            " auto read when a file is changed from the outside
set foldmethod=syntax   " enable code folding
set foldlevelstart=2
setlocal foldcolumn=4   " the number of columns to use for folding display at the left
" helper function to toggle show folding Column
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F2>

" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" this solves the "unable to open swap file" errors on Win7
set dir=~/tmp,/var/tmp,/tmp,$TEMP
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;/

" turns off all error bells, use a flash instead
set noerrorbells
set visualbell

set t_Co=256            " set the number of colors to 256 for the terminal
syntax on               " use syntax coloring: on/off/reset/clear

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#,*

" Number of screen lines to use for the command-line
set cmdheight=1

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l
set hlsearch            " highlight searched-for phrases
set incsearch           " show search matches as I type the search string"
set gdefault            " this makes search/replace global by default

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=80

" highlight column textwidth+1, ...
" set colorcolumn=+1,+2,+3,+4,+5,+6,+7,+8,+9,+10

" disable column highlight for textwidth+1, ... Use error Highlight instead.
set colorcolumn=0
match ErrorMsg '\%81v.' " Error highlight 81 column character only
" match ErrorMsg '\%>80v.\+' " Error highlight characters exceeding virtual 80 character

" In diff mode disregard white spaces
set diffopt+=iwhite
set diffexpr=""

if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

" UltiSnips is missing a setf trigger for snippets on BufEnter
autocmd vimrc BufEnter *.snippets setf snippets

" In UltiSnips snippet files, we want actual tabs instead of spaces for indents.
" US will use those tabs and convert them to spaces if expandtab is set when the
" user wants to insert the snippet.
autocmd vimrc FileType snippets set noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           More involved tweaks                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" remove trailing whitespace and empty lines
autocmd BufWritePre * :%s/\s\+$//e
" remove empty lines when saving
au BufWritePre *.* :silent! %s#\($\n\s*\)\+\%$##

augroup vimrc
  " Automatically delete trailing DOS-returns and whitespace on file open and
  " write.
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END

" Sets a font for the GUI
if has("gui_gtk2")
  set guifont=Source\ Code\ Pro\ for\ Powerline:h11
elseif has("gui_macvim")
  " My Mac has a fairly high DPI so the font needs to be bigger
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12
end

" Sometimes, $MYVIMRC does not get set even though the vimrc is sourced
" properly. So far, I've only seen this on Linux machines on rare occasions.
if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" Highlight Class and Function names
function! s:HighlightFunctionsAndClasses()
  syn match cCustomFunc      "\w\+\s*\((\)\@="
  syn match cCustomClass     "\w\+\s*\(::\)\@="

  hi def link cCustomFunc      Function
  hi def link cCustomClass     Function
endfunction

" TODO: this should:
" a) not be called for every filetype
" b) be in a separate plugin
au vimrc Syntax * call s:HighlightFunctionsAndClasses()

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" cindent is a bit too smart for its own good and triggers in text files when
" you're typing inside parens and then hit enter; it aligns the text with the
" opening paren and we do NOT want this in text files!
autocmd vimrc FileType text,markdown,gitcommit set nocindent

autocmd vimrc FileType markdown setlocal spell! spelllang=en_us

" prevents vim from continuing the comment automatically  on the next line
"set formatoptions-=r formatoptions-=o
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" save folds and load them when starting
"au BufWinLeave ?* mkview
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
"au BufWinEnter ?* silent loadview
autocmd BufWinEnter * if expand("%") != "" | silent loadview | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" our <leader> will be the space key
let mapleader=","

" our <localleader> will be the '-' key
let maplocalleader="-"

" Toggle list mode
nnoremap <silent> <Leader>lt :set list!<CR>

" Disable highlight when pressing <leader>/
nmap <silent> <leader>/ :nohlsearch<CR>

" toggle highlighting on and off by pressing one key: H
nnoremap <silent> <Leader>H :set cursorline! cursorcolumn!<CR>

" toggle numberline on and off by pressing one key: N
nnoremap <silent> <Leader>N :set number!<CR>

" toggle fold column show
nnoremap <silent> <leader>F :call FoldColumnToggle()<cr>

" shortcut for Ctrl-V<tab> keystroke sequence, to insert real tab
inoremap <S-Tab> <C-V><Tab>

" map <F9> to :make
"nnoremap <F9> :Make<CR><bar><Esc>:cw<CR>
nnoremap <F9> :Make<CR>

" this makes vim's regex engine "not stupid"
" see :h magic
nnoremap / /\v
vnoremap / /\v

" With this map, we can select some text in visual mode and by invoking the map,
" have the selection automatically filled in as the search text and the cursor
" placed in the position for typing the replacement text. Also, this will ask
" for confirmation before it replaces any instance of the search text in the
" file.
" NOTE: We're using %S here instead of %s; the capital S version comes from the
" eregex.vim plugin and uses Perl-style regular expressions.
vnoremap <C-r> "hy:%S/<C-r>h//c<left><left>

" Fast saving
nnoremap <leader>w :w!<cr>

" Quickly edit/reload the vimrc file
" <leader>ev brings up .vimrc
noremap <silent> <leader>ev :e! $MYVIMRC<CR>
" <leader>sv reloads it and makes all changes active (file has to be saved first)
noremap <silent> <leader>sv :so $MYVIMRC<CR>:AirlineRefresh<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" with this, we can now type ",." to exit out of insert mode
" if we really wanted to type ",.", then just type one char, wait half a sec,
" type another
inoremap ,. <Esc>
vnoremap ,. <Esc>

" CTRL-U and CTRL-W in insert mode cannot be undone.  Use CTRL-G u to first
" break undo, so that we can undo those changes after inserting a line break.
" For more info, see: http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Also center the screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" This makes j and k work on "screen lines" instead of on "file lines"; now, when
" we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" This is quit all
noremap <Leader>Q :qa<cr>

" key bindings for quickly moving between windows
" h left, l right, k up, j down
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disabling arrows left and right
map <left> <nop>
map <right> <nop>

" Remap up and down arrows to move current line up or down
" map <up> ddkP
" map <down> ddp
" using vim-move plugin also enables move for blocks in visual mode
nmap <up> <Plug>MoveLineUp
vmap <up> <Plug>MoveBlockUp
nmap <down> <Plug>MoveLineDown
vmap <down> <Plug>MoveBlockDown

" Switches to the previous buffer that was shown in the current window, but also
" closes the current buffer before switching to the previous one
noremap <leader>bq <c-^> :bd #<cr>

" Switch to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>

" Toggle and untoggle spell checking
noremap <leader>st :setlocal spell! spelllang=en_us<cr>

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" zw like zg but mark the word as a wrong (bad) word
" z= get suggestions
" zug/zuw undo zw and zg, remove the word from the dic
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sw zw
noremap <leader>sg z=

" list of abbreviation used to correct some frequent misspell
if filereadable($HOME . "/dotfiles/vim/frequently-misspelled-wordlist.vim")
  so $HOME/dotfiles/vim/frequently-misspelled-wordlist.vim
endif

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  HERE BE PLUGINS  ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim-glaive                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call glaive#Install()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-codefmt                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Requires vim-glaive
" use :FormatCode and :[range] FormatLine
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt clang_format_style='file'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Syncopate                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Google Syncopate requires Glaive
" for sharing beautiful code
" :SyncopateExportToClipboard (xclip is required)
" :SyncopateExportToBrowser
" exclude line numbers from the output
let g:html_number_lines = 0
" only current buffer is converted when diff
let g:html_diff_one_file = 1
" Enable Syncopate default key mapping: <Leader>< prefix
" for example: <Leade><>  runs SyncopateExportToClipboard on the whole buffer
Glaive syncopate plugin[mappings]
" Enable syncopate commands
Glaive syncopate plugin[commands]
" Clear background when Exporting
Glaive syncopate clear_bg
" Settin-up the browser command to use with SyncopateExportToBrowser
" defaults to 'sensible-browser'
if has("macunix")
  Glaive syncopate browser="open"
else
  Glaive syncopate browser="xdg-open"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ListToggle                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" error list window
let g:lt_location_list_toggle_map = '<leader>l'
" Quickfix window
let g:lt_quickfix_list_toggle_map = '<leader>q'
" spawned window height
let g:lt_height = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             delimitMate                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enable delimitMate mappings. :DelimitMateOn
"Disable delimitMate mappings. :DelimitMateOff
"Switches the plug-in on and off. :DelimitMateSwitch
let delimitMate_autoclose = 1
let delimitMate_jump_expansion = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_quotes = "\" ' ` *"
au FileType html let b:delimitMate_quotes = "\" '"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-airline                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" Enable wordcount
let g:airline#extensions#wordcount#enabled = 1
" Force status line to appear all the time
let g:airline_theme='powerlineish'
" enable/disable tmuxline integration
let g:airline#extensions#tmuxline#enabled = 0
" configure which mode colors should be used in tmux status line: normal, insert
let airline#extensions#tmuxline#color_template = 'normal'
" enable/disable syntastic integration
let g:airline#extensions#syntastic#enabled = 1
" enable/disable YouCompleteMe integration
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = '✗:'
let g:airline#extensions#ycm#warning_symbol = '⚠ :'
" configure the title text for quickfix and location list buffers
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             tmuxline                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change theme with command (need vim running inside tmux)
":Tmuxline [theme] [preset]
" Persist generated theme with :TmuxlineSnapshot [file]
" and source [file] in .tmux.conf
" set preset: full, tmux, nightly_fox, crosshair, minimal, powerline, righteous
" other presets available in autoload/tmuxline/presets/*

" let g:tmuxline_preset = 'powerline'
let g:tmuxline_preset = {
\'a'    : '#S',
\'b'    : '',
\'win'  : ['#F#I', '#W'],
\'cwin' : ['#F#I:#P', '#W'],
\'y' : ['%a %Y-%b-%d', '%R'],
\'z' : '#h',
\'options': {
  \'status-justify': 'left'
  \},
\'win_options' : {
  \'window-status-activity-attr' : 'none'
  \}
\}
" CPU an memory usage segment requires
"   https://github.com/thewtex/tmux-mem-cpu-load
if executable('tmux-mem-cpu-load')
  let g:tmuxline_preset.x = ['#(tmux-mem-cpu-load --graph 10 --interval 2)']
endif

" theme to use if airline-vim theme disabled in tmuxline: nightly_fox, zenburn
" jellybeans, iceberg, airline, powerline, vim_powerline, vim_statusline_[1~3]
let g:tmuxline_theme = 'powerline'
" create a snapshot file of the last set statusline
" tmuxline#api#snapshot('~/.tmuxline_snapshot.conf')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-session                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" you also need to run :SaveSession once to create the default.vim session that
" will then be autoloaded/saved from then on
" Available <Action>:  save, open, close, delete, Tab<Action>, view

let g:session_autoload        = 'no'
let g:session_autosave        = 'yes'
let g:session_default_to_last = 'yes'
let g:session_directory       = '~/tmp/vim/sessions'
" use Session<Action> alias for <Action>Session
let g:session_command_aliases = 1
nnoremap <leader>So :OpenSession
nnoremap <leader>Ss :SaveSession
nnoremap <leader>Sd :DeleteSession<CR>
nnoremap <leader>Sc :CloseSession<CR>
nnoremap <leader>Sv :ViewSession<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             YankRing                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:yankring_history_dir = '$HOME/tmp/vim'
" this is so that single char deletes don't end up in the yankring
let g:yankring_min_element_length = 2
let g:yankring_window_height = 14
nnoremap <leader>R :YRShow<CR>

" this makes Y yank from the cursor to the end of the line, which makes more
" sense than the default of yanking the whole current line (we can use yy for
" that)
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-git                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on spell checking by default for git commit messages
au vimrc FileType gitcommit setlocal spell! spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-colors-solarized                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use transparent background: 1 | 0
let g:solarized_termtrans=0
" Use degraded 256 colorscheme instead of the accurate ansi 16 colorscheme
let g:solarized_termcolors=16
" visibility of white-spaces when using set list. Could be: low, normal or high
let g:solarized_visibility="normal"
" Set local background color: light | dark
if has('gui_running')
  setlocal background=dark
else
  setlocal background=light
endif
" toggle background color from light to dark and vice-versa
call togglebg#map("<F5>")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-notes                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             gundo                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" gundo plugin key mapping
nnoremap <F4> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             TComment                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Toggle comments
nmap <leader>tc :TComment<CR>
vmap <leader>tc :TComment<CR>
"Toggle comments as a block
nmap <leader>tb :TCommentBlock<CR>
vmap <leader>tb :TCommentBlock<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             CommandT                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>e :CommandT<CR>
nmap <leader>b :CommandTBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-preview                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This forces vim-preview to use the default browser on linux; it already uses
" 'open' on Mac.
if has("unix")
  let g:PreviewBrowsers = "xdg-open"
endif

let g:PreviewMarkdownFences = 1

" Use :Preview command to open in browser!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             bufexplorer                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffer Explorer uses mappings: <leader>+be/bs/bv/bt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                bufkill                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use the arrows for something useful
" :BB switches to the previous buffer shown in the current window, :BF switches
" to the next one; it's like a buffer history for every window
noremap <right> :BF<cr>
noremap <left> :BB<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             syntastic                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set your compiler executable(defaults to g++, or clang++ if g++ is not found)
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_checkers = ['gcc','clang_check','clang_tidy']
" in order to check header files
let g:syntastic_cpp_check_header = 1
" To enable header files being re-checked on every file write
let g:syntastic_cpp_auto_refresh_includes = 1
" To disable the include of the default include dirs (such as /usr/include)
let g:syntastic_cpp_no_default_include_dirs = 1
" add additional compiler options to the syntax checking execution
let g:syntastic_cpp_compiler_options = ' -std=c++1y -pthread'
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
" enable or disable debugging syntastic output
let g:syntastic_debug = 0
" Aggregate errors from multiple checkes
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>>'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = {
       \ "mode": "active",
       \ "active_filetypes": [],
       \ "passive_filetypes": ["html"] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             YouCompleteMe                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable or disable YCM as syntax checker. Can't use other checker in Syntastic
" so either use syntastic with gcc or cpplint or instead use YCM
let g:ycm_register_as_syntastic_checker = 1 "1|0
let g:ycm_auto_trigger = 1
let g:ycm_add_preview_to_completeopt = 1 "close preview screen after insertion
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'vim' : 1
      \}
let g:ycm_filetype_specific_completion_to_disable = {}
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
" fallback configuration file for compilation flags
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" always ask before loading a config file
let g:ycm_confirm_extra_conf = 1
" globbing for configuration files compilation flags. white list start without !
" and blacklisted item starts with !. This option isn't used when
" disabling ycm_confirm_extra_conf
let g:ycm_extra_conf_globlist = ['git_working/*', '~/*']
" disable tab for YCM in favour of Ultisnips
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_key_detailed_diagnostics = '<leader>d'

nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yD :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yd :YcmCompleter GoToDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             UltiSnips                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration.
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             supertab                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-indent-guide                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
:nmap <silent> <Leader>ie <Plug>IndentGuidesEnable
:nmap <silent> <Leader>id <Plug>IndentGuidesDisable
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 7
let g:indent_guides_guide_size = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-javascript-syntax                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType javascript call JavaScriptFold()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Javascript-libraries-syntax                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:used_javascript_libs = 'jquery,angularjs, angularui'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Rainbow                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Rainbow Parentheses Improved (better than Rainbow Parenthesis)

" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Misc.                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clear the screen after existing  Vim
au VimLeave * :!clear

" read file in a different encoding example: shift-jis for instance
"vim -c "e ++enc=shift-jis"  file
