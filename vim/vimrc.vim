"---------------------------------------
" add Vundle plugin management support
"---------------------------------------
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
set nocompatible " this Vi IMproved not vi (required by Vundle)
filetype off " required for Vundle to work: turn it back after bundles list
set rtp+=~/.vim/bundle/Vundle.vim " Vundle  runtime path

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"--------------------------------------------------------------------


"===================
" My Vundle Plugin goes here:
"====================
" original repos on github
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'YankRing.vim'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmtlib'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
Plugin 'vim-jp/cpp-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'oblitum/rainbow'
Plugin 'Valloric/ListToggle' "toggling the display of the quickfix list and the location-list
Plugin 'Valloric/MatchTagAlways'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup.git', {'rtp': 'vim/'}
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'aaronbieber/vim-quicktask'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-session'
Plugin 'terryma/vim-multiple-cursors'

" this plugin for indenting php: not sure if it is useful! To test beforehand
Plugin '2072/PHP-Indenting-for-VIm'

Plugin 'nathanaelkane/vim-indent-guides'
" buffer explorer: use <leader>+be/bs/bv/bt
Plugin 'jlanzarotta/bufexplorer'

Plugin 'wincent/command-t'
"Plugin 'wincent/Command-T'

Plugin 'othree/html5-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'

Plugin 'marijnh/tern_for_vim' "requires nodejs, npm. run npm install in folder
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jiangmiao/simple-javascript-indenter'

Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'groenewege/vim-less'
Plugin 'jnwhiteh/vim-golang'
Plugin 'evanmiller/nginx-vim-syntax'

" Github repos of the user 'vim-scripts'  => can omit the username part
Plugin 'jQuery'
Plugin 'a.vim'
Plugin 'Gundo'
Plugin 'L9'
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'FuzzyFinder'
Plugin 'google.vim'
Plugin 'Conque-GDB'
Plugin 'wordlist.vim'
Plugin 'Vimball'

" non github repos: Plugin 'git://git.wincent.com/command-t.git'
" ...

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

"---------------------------------------
" Vundle Plugin End
"---------------------------------------
call vundle#end()
filetype plugin indent on "turn on back plugin and indent for filetype: required
"--------------------------------------------------------------------

set rtp+=$HOME/dotfiles/vim

" TODO: transfer all our custom mapping to our vim_shortcuts file

"---------------------------------------
" change the mapleader from \ to ,
"---------------------------------------
let mapleader=","
let maplocalleader="-"
"--------------------------------------------------------------------

" with this, we can now type ",." to exit out of insert mode
" if we really wanted to type ",.", then just type one char, wait half a sec,
" type another
inoremap ,. <Esc>
vnoremap ,. <Esc>

set autoread        " automatically update file when edited outside of Vim

syntax on           " use syntax coloring
set ruler           " set ruler: show line and column number
set hidden          " abandoned buffers become hidden
set title           " set window title to filename
set textwidth=80    " text width is 80 columns

set visualbell      " Silence the bell, use a flash instead
set noerrorbells    " don't beep
set cursorline      " Dislay a line under the current cursor line
set number          " Display line numbers, use set nonumber to disable
set showcmd         " Show (partial) command in status line.

set ignorecase      " case insensitive searching
set smartcase       " but become case sensitive if you type uppercase characters

set showmatch       " Show matching brackets/braces/parantheses.
set autoindent      " set autoindent
set copyindent      " copy the previous indentation on autoindenting
set smarttab        " smart tab handling for indenting
set shiftwidth=2    " set shiftwidth to 2 spaces
set tabstop=2       " set tab to 2 spaces
set softtabstop=2   " makes the spaces feel like real tabs
set shiftround " makes indenting a multiple of shiftwidth
set expandtab       " replace Tabs with white spaces, unless using Ctrl-V<tab>
" modifiers private, public and protected indented +1 space and lineup +1space
"set cinoptions=+g1,+h1

" highlight column textwidth+1, ...
"set colorcolumn=+1,+2,+3,+4,+5,+6,+7,+8,+9,+10
set colorcolumn=0

set undofile " stores undo state even when files are closed (in undodir)

" This changes the default display of tab and CR chars in list mode
set listchars=tab:▸\ ,eol:¬
set list

" this solves the "unable to open swap file" errors on Win7
set dir=~/tmp,/var/tmp,/tmp,$TEMP
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

" this makes vim's regex engine "not stupid"
" see :h magic
nnoremap / /\v
vnoremap / /\v

if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif

"---------------------------------------
" prevents vim from continuing the comment automatically  on the next line
"---------------------------------------
"set formatoptions-=r formatoptions-=o
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
"--------------------------------------------------------------------

"---------------------------------------
" paste mode from clipboard without extra spaces
"---------------------------------------
"use ':set paste'  to enable copying from clipboard without extra spaces
"use ':set nopaste' to switch it back off
" Toggle paste mode
set pastetoggle=<F2>
"--------------------------------------------------------------------

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

"---------------------------------------
" useful re-mappings
"---------------------------------------
" shortcut for Ctrl-V<tab> keystroke sequence, to insert real tab
inoremap <S-Tab> <C-V><Tab>

" Sometimes, $MYVIMRC does not get set even though the vimrc is sourced
" properly. So far, I've only seen this on Linux machines on rare occasions.
if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" toggle highlighting on and off by pressing one key: H
nnoremap <silent> <Leader>H :set cursorline! cursorcolumn!<CR>
" toggle numberline on and off by pressing one key: N
nnoremap <silent> <Leader>N :set number!<CR>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" Fast saving
nnoremap <leader>w :w!<cr>

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

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

" This makes j and k work on "screen lines" instead of on "file lines"; now,
" when we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk
"--------------------------------------------------------------------

"---------------------------------------
" enable spell checker
"---------------------------------------
" setlocal spell spelllang=en_us
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
noremap <leader>su z=
" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>
" We want our cross-machine spell file to be used
set spellfile=$HOME/dotfiles/vim/spell/en.utf-8.add
"--------------------------------------------------------------------

"---------------------------------------
" use the search highlight
"---------------------------------------
set hlsearch    " highlight previously searched-for phrases
set incsearch     " show search matches as I type the search string"
set gdefault " this makes search/replace global by default
" disable highlight when pressing <leader>/
nmap <silent> <leader>/ :nohlsearch<CR>
"--------------------------------------------------------------------

"---------------------------------------
" Error highlight line charcters exceeding virtual 80 character
"---------------------------------------
"match ErrorMsg '\%>80v.\+'
" Error highlight 81 line charcters only (this is less visually aggressive than
" previous)
match ErrorMsg '\%81v.'
"--------------------------------------------------------------------

"---------------------------------------
" disable backup and swap file
"---------------------------------------
set nobackup
set noswapfile
"--------------------------------------------------------------------

"---------------------------------------
" remove trailing whitespace and empty lines
"---------------------------------------
"remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" remove empty lines when saving
au BufWritePre *.* :silent! %s#\($\n\s*\)\+\%$##
"--------------------------------------------------------------------

"---------------------------------------
" Arrow keys remapping
"---------------------------------------
" disabling arrows left and right
map <left> <nop>
map <right> <nop>
" remapping up and down arrows to move current line up or down
map <up> ddkP
map <down> ddp
"--------------------------------------------------------------------

"---------------------------------------
" split window easy navigation
"---------------------------------------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"--------------------------------------------------------------------

"---------------------------------------
" popup menu and popup menu select colors
"---------------------------------------
"highlight Pmenu ctermfg=<color> ctermbg=<color>
"highlight PmenuSel ctermfg=<color> ctermbg=<color>
highlight Pmenu ctermfg=Black ctermbg=White gui=bold
highlight PmenuSel ctermfg=White ctermbg=DarkGray gui=bold
"--------------------------------------------------------------------

"---------------------------------------
" enable code folding
"---------------------------------------
set foldmethod=syntax
" fold level to start with
set foldlevelstart=2
" the number of columns to use for folding display at the left
setlocal foldcolumn=4
" save folds and load them when starting
"au BufWinLeave ?* mkview
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
"au BufWinEnter ?* silent loadview
autocmd BufWinEnter * if expand("%") != "" | silent loadview | endif
" helper function
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction
" toggle show folding Column
nnoremap <silent> <leader>F :call FoldColumnToggle()<cr>
"--------------------------------------------------------------------

"---------------------------------------
" delimitMate plugin
"---------------------------------------
"Enable delimitMate mappings. :DelimitMateOn
"Disable delimitMate mappings. :DelimitMateOff
"Switches the plug-in on and off. :DelimitMateSwitch

let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_quotes = "\" ' ` *"
au FileType html let b:delimitMate_quotes = "\" '"
"--------------------------------------------------------------------

"---------------------------------------
" powerline plugin
"---------------------------------------
" powerline: when statusline is hidden or or appear only in split window
let g:Powerline_symbols = "unicode" "fancy | unicode?
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set noshowmode " Hide the default mode text below status line
set showtabline=2 " Always show the tabline even if we have only one tab"
"--------------------------------------------------------------------

"---------------------------------------
" reset vimrc augroup
"---------------------------------------
" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END
"--------------------------------------------------------------------

"---------------------------------------
"
"---------------------------------------
augroup vimrc
  " Automatically delete trailing DOS-returns and whitespace on file open and
  " write.
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END
"--------------------------------------------------------------------

"---------------------------------------
" Encoding
"---------------------------------------
" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif
"--------------------------------------------------------------------

"---------------------------------------
" Session plugin
"---------------------------------------
" you also need to run :SaveSession once to create the default.vim session that
" will then be autoloaded/saved from then on

let g:session_autoload        = 'no'
let g:session_autosave        = 'yes'
let g:session_default_to_last = 'yes'
let g:session_directory       = '~/tmp/vim/sessions'
"--------------------------------------------------------------------

"---------------------------------------
" YankRing Plugin
"---------------------------------------
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
"--------------------------------------------------------------------

"---------------------------------------
" Plugin vim-git
"---------------------------------------
" Turn on spell checking by default for git commit messages
au vimrc FileType gitcommit setlocal spell! spelllang=en_us
"--------------------------------------------------------------------

"---------------------------------------
" Solarized theme
"---------------------------------------
" enable solarized theme colors
syntax enable
let g:solarized_termtrans = 0
let g:solarized_termcolors=256
" visibility of white-spaces when using set list. Could be: low, normal or high
let g:solarized_visibility="low"
setlocal background=light "light | dark"
colorscheme solarized
call togglebg#map("<F5>")
"--------------------------------------------------------------------

"---------------------------------------
" map <F9> to :make
"---------------------------------------
"nnoremap <F9> :Make<CR><bar><Esc>:cw<CR>
nnoremap <F9> :Make<CR>
"--------------------------------------------------------------------

"---------------------------------------
" ListToggle
"---------------------------------------
" error list window
let g:lt_location_list_toggle_map = '<leader>l'
" Quickfix window
let g:lt_quickfix_list_toggle_map = '<leader>q'
" spawned window height
let g:lt_height = 10
"--------------------------------------------------------------------

"---------------------------------------
" astyle tool use from vim
"---------------------------------------
" Autoformat plugin key mapping
"noremap <F3> :Autoformat<CR><CR>
"let g:formatprg_cs = "astyle"
" using astyle directly instead of Autoformat
" formatting style is in ~/.astylerc
nnoremap <F3> :%!astyle<CR><CR>
"--------------------------------------------------------------------

"---------------------------------------
" Google CodeFmt and Glaive
"---------------------------------------
" use :FormatCode and :[range] FormatLine
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
"--------------------------------------------------------------------

"---------------------------------------
" vim-notes settings
"---------------------------------------
let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'
"--------------------------------------------------------------------

"---------------------------------------
" Gundo plugin key mapping
"---------------------------------------
nnoremap <F4> :GundoToggle<CR>
"--------------------------------------------------------------------

"---------------------------------------
" TComment plugin
"---------------------------------------
"Toggle comments
nmap <leader>tc :TComment<CR>
vmap <leader>tc :TComment<CR>
"Toggle comments as a block
nmap <leader>tb :TCommentBlock<CR>
vmap <leader>tb :TCommentBlock<CR>
"--------------------------------------------------------------------

"---------------------------------------
" CommandT
"---------------------------------------
nmap <leader>e :CommandT<CR>
nmap <leader>b :CommandTBuffer<CR>
"--------------------------------------------------------------------

"---------------------------------------
" Syntastic plugin
"---------------------------------------
" Set your compiler executable(defaults to g++, or clang++ if g++ is not found)
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_checkers = ['gcc','ycm','clang_check','clang_tidy']
" in order to check header files
let g:syntastic_cpp_check_header = 1
" To enable header files being re-checked on every file write
let g:syntastic_cpp_auto_refresh_includes = 1
" To disable the include of the default include dirs (such as /usr/include)
let g:syntastic_cpp_no_default_include_dirs = 1
" add additional compiler options to the syntax checking execution
let g:syntastic_cpp_compiler_options = ' -std=c++1y -pthread'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" enable or disable debugging syntastic output
let g:syntastic_debug = 0
" Aggregate errors from multiple checkes
let g:syntastic_aggregate_errors = 0
" cpplint argument to be passed by syntastic
" let g:syntastic_cpp_cpplint_thres =5
" let g:syntastic_cpp_cpplint_args = '--verbose=3'
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>>'
"--------------------------------------------------------------------

"---------------------------------------
" YouCompleteMe (YCM) Plugin
"---------------------------------------
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
" disable tab for YCM in favour of Ultisnips
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_key_detailed_diagnostics = '<leader>d'
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

nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yc :YcmCompleter GoToDeclaration<CR>
"--------------------------------------------------------------------

"---------------------------------------
" UltiSnips plugin
"---------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"--------------------------------------------------------------------

"---------------------------------------
" supertab plugin
"---------------------------------------
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1
"--------------------------------------------------------------------

"---------------------------------------
" vim-indent-guide plugin key mapping
"---------------------------------------
:nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
:nmap <silent> <Leader>ie <Plug>IndentGuidesEnable
:nmap <silent> <Leader>id <Plug>IndentGuidesDisable
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 7
let g:indent_guides_guide_size = 2
"--------------------------------------------------------------------

"---------------------------------------
" vim-javascript-syntax plugin
"---------------------------------------
au FileType javascript call JavaScriptFold()
"--------------------------------------------------------------------

"---------------------------------------
" Javascript libraries syntax plugin"
"---------------------------------------
let g:used_javascript_libs = 'jquery,angularjs, angularui'
"--------------------------------------------------------------------

"---------------------------------------
" Rainbow Parentheses setting
"---------------------------------------
" let g:rbpt_colorpairs = [
"       \ ['brown',       'RoyalBlue3'],
"       \ ['Darkblue',    'SeaGreen3'],
"       \ ['darkgray',    'DarkOrchid3'],
"       \ ['darkgreen',   'firebrick3'],
"       \ ['darkcyan',    'RoyalBlue3'],
"       \ ['darkred',     'SeaGreen3'],
"       \ ['darkmagenta', 'DarkOrchid3'],
"       \ ['brown',       'firebrick3'],
"       \ ['gray',        'RoyalBlue3'],
"       \ ['black',       'SeaGreen3'],
"       \ ['darkmagenta', 'DarkOrchid3'],
"       \ ['Darkblue',    'firebrick3'],
"       \ ['darkgreen',   'RoyalBlue3'],
"       \ ['darkcyan',    'SeaGreen3'],
"       \ ['darkred',     'DarkOrchid3'],
"       \ ['red',         'firebrick3'],
"       \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" " always on
" au VimEnter * RainbowParenthesesToggle " Toggle it on/off
" au Syntax * RainbowParenthesesLoadRound " (), the default when toggling
" au Syntax * RainbowParenthesesLoadSquare " []
" au Syntax * RainbowParenthesesLoadBraces " {}
" au Syntax * RainbowParenthesesLoadChevrons  " <>
"--------------------------------------------------------------------

"---------------------------------------
" Rainbow Parentheses Improved (better than Rainbow Parenthesis)
"---------------------------------------
let g:rainbow_active = 1
"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
"let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"--------------------------------------------------------------------

" list of abbreviation used to correct some frequent misspell
if filereadable($HOME . "/dotfiles/vim/frequently-misspelled-wordlist.vim")
  so $HOME/dotfiles/vim/frequently-misspelled-wordlist.vim
endif

" Clear the screen after existing  Vim
au VimLeave * :!clear

" read file in a different encoding: shift-jis for instance
"vim -c "e ++enc=shift-jis"  file
