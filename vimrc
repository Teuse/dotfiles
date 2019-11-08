""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Neccessary for Vundle. We can turn it on later again
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Gundo'
Plugin 'rhysd/vim-clang-format'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'fatih/vim-go'
Plugin 'vim-syntastic/syntastic'

Plugin 'peterhoeg/vim-qml'
Plugin 'artoj/qmake-syntax-vim'
Plugin 'milch/vim-fastlane'
Plugin 'leshill/vim-json'
Plugin 'vapor-community/vim-leaf'

" Plugin 'teuse/hopper'
" Plugin 'teuse/vimake'
" Plugin 'teuse/ogrep'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let mapleader   = "\<space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on

" Reload buffer on entering a buffer
au FocusGained,BufEnter * :silent! !
" Save on buffer switch
au FocusLost,WinLeave * :silent! w

" Disable auto-comment on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable Ex-mode.. dont need that mode
noremap Q <Nop>

set autoread
set history=700
set relativenumber
set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set splitbelow
set splitright

" the quickfix window should always have the full width
autocmd filetype qf wincmd J

nnoremap <leader>ev :tabnew $HOME/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ez :tabnew $HOME/.zshrc<cr>
nnoremap <leader>sz :source $HOME/.zshrc<cr>

" If using swap files, than store this files in this folder
set noswapfile
" set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backups//

" Set 7 lines to the cursor - when moving vertically using j/k
set so=10

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Automatically wrap left and right
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight current cursor position by underlining the current line
hi CursorLine cterm=underline
nnoremap <Leader>c :set cursorline!<CR>
set cursorline

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The key 'u' is UNDO, therefore 'U' makes sense for REDO
nnoremap U <C-r>

" Newline on Enter on normal mode
nnoremap <CR> o<Esc>

" Fast saving
nnoremap <leader>w :wa!<cr>

" Search and Replace
nnoremap <leader>sr :%s//gc <left><left><left><left>

nnoremap <leader>json :%!python3 -m json.tool<CR>

nnoremap <leader>py <Esc>:w<CR>:!clear;python3 %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" override search color
" hi Search ctermbg=gray
hi Search ctermfg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" Set tab-width per file
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype pp   setlocal ts=2 sts=2 sw=2
autocmd Filetype py   setlocal ts=4 sts=4 sw=4


" Linebreak on 500 characters
set lbr
set tw=500

set autoindent
set smartindent
set wrap "Wrap lines

" Turn off auto-indent when pasting text
set pastetoggle=<F3>

"Tabularize
nnoremap <Leader>== :Tabularize /=<CR>
vnoremap <Leader>== :Tabularize /=<CR>
nnoremap <Leader>:: :Tabularize /:\zs<CR>
vnoremap <Leader>:: :Tabularize /:\zs<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, files, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader>n :noh<cr>

" replace include"" with include<>
nnoremap <silent> <Plug>RefactorInclude 0f"xi<<Esc>f"xa><Esc>j
\:call repeat#set("\<Plug>RefactorInclude")<CR>
nmap ,. <Plug>RefactorInclude

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
" set viminfo^=%,n$HOME/.vim/viminfo

" Center curser on screen after jump
nnoremap n nzz
nnoremap } }zz

" Jump halfe page up/down
noremap J <c-d>
noremap K <c-u>

" Start/End of line more handy
noremap H  ^
noremap HH 0
noremap L  $

" Fast moving in quckfix window
noremap <leader>n :cnext<cr>
noremap <leader>p :cprevious<cr>

noremap { :tabp<cr>
noremap } :tabn<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Some more Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :Explore<CR>

" change word to upper case
noremap <c-u> <esc>mzviwU<esc>`z

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Hide quickfix window
noremap <leader>cc :cclose<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" When shifting in visual mode, do not remove selection
:vnoremap < <gv
:vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy to system clipboard
"
" Note : Need to be at the end of all the mapping. Otherwise
"        it conficts with something else. Unfortunately, I
"        couldn't find out the problem
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fast copy to system clipboard
noremap <leader>y    "+y
noremap <leader>yy   "+yy
noremap <leader>yiw  "+yiw

noremap <leader>d    "+d
noremap <leader>dd   "+dd
noremap <leader>diw  "+diw

noremap <leader>p    "+p
noremap <leader>P    "+P

nnoremap <leader>--   <CR># ----------------------------------------------------------------------<CR><CR><esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CLANG FORMAT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>cf :ClangFormat <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM BETTER WHITESPACES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=darkgray
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:current_line_whitespace_disabled_soft=1
let g:strip_whitespace_confirm=0
" autocmd FileType * EnableStripWhitespaceOnSave

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => The Silver Searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep --nogroup --nocolor'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  nnoremap <Leader>a :Ack! -i<Space>
  noremap <Leader>aa :Ack! -i <C-R><C-W><Space>
else
  echoerr "Ack not installed: brew install the_silver_searcher"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AIRLINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='murmur'

" let g:airline_section_y=''
" let g:airline_section_error=''
let g:airline_section_warning=''

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled  = 0

let g:airline#extensions#tabline#show_buffers = 0
let airline#extensions#tabline#tab_min_count = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_python_flake8_args='--ignore=E401,F403,F405,E501,E221'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*/tmp/*,*/build*/*,*.so,*.swp,*.zip

nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" Open ycm conf files without confirmation
let g:ycm_extra_conf_globlist = ['~/Development/CDevelop/*','~/NIBuild/*']
" disable syntags checks
let g:ycm_show_diagnostics_ui = 0

let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_comiwletion = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0
" Set no max file limit
let g:ctrlp_max_files = 0
" Open files in current split
let g:ctrlp_reuse_window  = 'startify'
" ignore git/hg/svn folder
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-GO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_doc_keywordprg_enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

