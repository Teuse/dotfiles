""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Neccessary for Vundle. We can turn it on later again
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Gundo'
Plugin 'tpope/vim-fugitive'

Plugin 'peterhoeg/vim-qml'
Plugin 'artoj/qmake-syntax-vim'
Plugin 'b4winckler/vim-objc'

Plugin 'teuse/ogrep'
Plugin 'teuse/hopper'
Plugin 'teuse/vimake'

" Plugin 'gilligan/vim-lldb'
" Plugin 'scrooloose/syntastic'
" Plugin 'rdnetto/YCM-Generator'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Disable auto-comment on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader   = "\<space>"

" Fast saving
nnoremap <leader>w :wa<cr>

" Newline on Enter on normal mode
nnoremap <CR> o<Esc>

" The key 'u' is UNDO, therefore 'U' makes sense for REDO
nnoremap U <C-r>

" Disable Ex-mode.. dont need that mode
noremap Q <Nop>

" show relative numbers for faster movements
set relativenumber
set number

" the quickfix window should always have the full width
autocmd filetype qf wincmd J

" exit edit mode
inoremap jk <esc>
vnoremap jkj <esc>

" Quick edit .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Disable Swap files
set noswapfile

" If using swap files, than store this files in this folder
set directory^=$HOME/.vim/tmp//


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search options
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Search and Replace
nnoremap <leader>sr :%s//gc <left><left><left><left>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" New splits appear right/below
set splitbelow
set splitright

" Highlight current cursor position by underlining the current line
hi CursorLine   cterm=underline
nnoremap <Leader>c :set cursorline!<CR>
set cursorline



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
 endif

" Set utf8 as standard encoding and en_US as the standard
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Turn off auto-indent when pasting text
set pastetoggle=<F3>

"Tabularize
nnoremap <Leader>== :Tabularize /=<CR>
vnoremap <Leader>== :Tabularize /=<CR>
nnoremap <Leader>:: :Tabularize /:\zs<CR>
vnoremap <Leader>:: :Tabularize /:\zs<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, files, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader>n :noh<cr>

" replace include"" with include<>
noremap ,. 0f"xi<<Esc>f"xa><Esc>j


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
set viminfo^=%

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

noremap < :tabp<cr>
noremap > :tabn<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Some more Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :Explore<CR>

nnoremap <silent> <Leader>b :TagbarToggle<CR>

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

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
endif

" When shifting in visual mode, do not remove selection
:vnoremap < <gv
:vnoremap > >gv

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


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

"C++ style seperator
nnoremap <leader>--   <CR>I//---------------------------------------------------------------------<CR><CR><esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AIRLINE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='murmur'

let g:airline_section_y=''
let g:airline_section_error=''
let g:airline_section_warning=''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled  = 0

let g:airline#extensions#tabline#show_buffers = 0
let airline#extensions#tabline#tab_min_count = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*/tmp/*,*/build*/*,*.so,*.swp,*.zip

nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" Open ycm conf files without confirmation
let g:ycm_extra_conf_globlist = ['~/Development/CDevelop/*','~/NIBuild/*']
" disable syntags checks
let g:ycm_show_diagnostics_ui = 1


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
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    en
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
