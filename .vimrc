" Global: /etc/vimrc or possibly /etc/vim/vimrc
" Local : $HOME/.vimrc or $HOME/.vim/vimrc
"
" Inspired by the work of the folowing authors
" author: Klaus Franken     <kfr@suse.de>
" author: Werner Fink       <werner@suse.de>
" author: Florian La Roche  <florian@suse.de>
" Reworked and collected by: 
" author: Norbert Heimsath  <norbert@heimsath.org>
"
" version: 1.2.2
" commented lines start with `"'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Basic Editor Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings for the main Vim editor

" enable syntax highlighting
syntax on                      

" set colorsheme
colorscheme desert                    

" wrap lines
set wrap

"  tells Vim to only wrap at a character in the breakat option
set linebreak

" list disables linebreak
set nolist

" a tab is four spaces
set tabstop=4

" when hitting <BS>, pretend like a tab is removed, even if spaces
set softtabstop=4

" expand tabs by default (overloadable per file type later)
set expandtab

" number of spaces to use for autoindenting
set shiftwidth=4            

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" always/dont show line numbers
set nonumber

" set show matching parenthesis
set showmatch

" insert tabs on the start of a line according to
"    shiftwidth, not tabstop
set smarttab

" allow the cursor to go in to "invalid" places
set virtualedit=all

" highlight search terms
set hlsearch

" enable using the mouse if terminal emulator
"set mouse=a

" Keep a persistent backup file
" in a place that does not interferre whith version controlls
if v:version >= 730
    set undofile        
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif

" do not keep backup files, it's 70's style cluttering
set nobackup

" do not write annoying intermediate swap files,
" who did ever restore from swap files? (in the times of version controll)
set noswapfile

" store swap files in one of these directories
"    (in case swapfile is ever turned on)
set directory=~/.vim/.tmp,~/tmp,/tmp

" read/write a .viminfo file, don't store more
"    than 80 lines of registers
set viminfo='20,\"80  

" make tab completion for files/buffers act like bash
set wildmenu

" show a list when pressing tab and complete
"    first full match
set wildmode=list:full
                              
" Ignore in wildemode
set wildignore=*.swp,*.bak,*.pyc,*.class

" change the terminal's title
set title

" don't beep
set visualbell

" don't beep
set noerrorbells   

" show (partial) command in the last line of the screen
"    this also shows visual selection info
set showcmd  

" disable mode lines (security measure)
set nomodeline  

" always use a fast terminal  (had trouble whith this)
"set ttyfast   

" underline the current line, for quick orientation (do not like this)
set nocursorline              
" set cursorline

" automatically indent lines (default)
" (need to take a closer look at these both not entirely happy whith behavior)
set autoindent
set smartindent

" Case Settings when searching
" We actuallly ignore case when search is all lower case
" are casesensitive if search string contains even a single uppercase char
"  to turn this off use noignorecase / nosmartcase

" ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smartcase                   

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility.
"          Switch it off if you prefer real vi compatibility
set nocompatible


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CustomStatusbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                " Display statusline
set statusline=%f               " relative filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'},
                                "file encoding
set statusline+=%{&ff}]         "file format
set statusline+=%h              "help file flag

set statusline+=%m              "modified flag
set statusline+=%r              "read only flag
set statusline+=%y              "filetype
set statusline+=%=              "left/right separator
set statusline+=\ Col:
set statusline+=%c,              "cursor column
set statusline+=\ Ln:
set statusline+=%l/%L            "cursor line/total lines
set statusline+=\ %P             "percent through file

""""""""""""""""""""""""""
" File editor settings
""""""""""""""""""""""""""
" Settings for the buildin filemanager 'netrw'

" open new file whith v opens it on the right side
let g:netrw_altv=1

"  Set the default listing style:
"= 0: thin listing (one file per line)
"= 1: long listing (one file per line with timestamp information and file size)
"= 2: wide listing (multiple files in columns)
"= 3: tree style listing
let g:netrw_liststyle = 0

" Remove the banner to save space
let g:netrw_banner = 0

" Set how files are opened
"1 - open files in a new horizontal split
"2 - open files in a new vertical split
"3 - open files in a new tab
"4 - open in previous window
"let g:netrw_browse_split = 2

" Set filemanager whidth in percent
let g:netrw_winsize = 20

" Sets the leader to ',' as '\' is ugly on german keyboards
:let mapleader = ","

" in :Le press ,n to create the file in the neighbour window
" so buffer is opened there and not in filemanager.  
augroup netrw
autocmd!
autocmd filetype netrw nmap <buffer> <leader>n <c-w>l:edit .<cr>%
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extra editor mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trying to have an absolute minimum of custom Mappings
" as i dont want to rely on this too much.  
" But still they are extremely helpfull.

" Add a line in normal mode pressing <CR>
" Remove em whith J (just an info)
nnoremap <CR> :a<CR><CR>.<CR>

" More elegant soloution
" oo insert newline below
" OO insert newline above
" Optionally simply delete lines whith dd (just more info)
nmap oo o<Esc>k
nmap OO O<Esc>j

" pastemode for clean pasting whithout Auto ident
" insert (paste)
" :set paste  || :set nopaste
" https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim
set pastetoggle=<leader>p

"Insert one letter whith ctrl-i in command mode
"r does relace a single char
"x and X delete a single char
nnoremap <C-i> i_<Esc>r

" Open a new tab whith filemanager on left side
nmap <leader>t :tabnew<CR>:Le<CR>

" closing is not that trivial maybe the first thought isnt optimal but still functional
" nmap <leader>T :tabclose<CR>
" https://stackoverflow.com/questions/32714834/how-to-close-a-tab-in-vim
nmap <leader>T ::windo bd


" Tabline whith Tab numbers
" For easy changing tabs whith <num>gt
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif


" Help whith easy search and replace
" By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with.
" Press enter and then confirm each change you agree with y or decline with n.
" This command will override your register h so you can choose other one (
" by changing h in the command below to another lower case letter) that you don't use.
" You still need to escape / in the text , or choose another delimiter (maybe ,)
" I preset this to 'no' magic so most special chars are ignored
vnoremap <C-r> "hy:%sno/<C-r>h//gc<left><left><left>


" Deleting a line whitout cutting it to register
nnoremap <leader>d A<C-u><Esc>


" Automatically activate Autocomplete for PHP
" See more here: https://www.simplified.guide/vim/auto-complete-php
" try Ctrl + x followed by Ctrl + o after typing 'dat'
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType module set omnifunc=phpcomplete#CompletePHP


" /etc/vimrc ends here
