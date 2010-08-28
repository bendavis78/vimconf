" defaults
:set ts=4 sw=4 ai encoding=utf-8 et
:set pastetoggle=<F8>
:set background=dark
:set nowrap
:set hlsearch
:set viminfo='20,\"1000

" disable the annoying HTML link underlining
:hi link htmlLink NONE
:hi link htmlItalic NONE

" enable mouse
:set mouse=a

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
syntax on
endif

autocmd BufRead *.html      set filetype=htmldjango
autocmd BufRead .bash*      set filetype=sh
autocmd BufRead *.json      set filetype=javascript

filetype plugin on

" markup languages
autocmd FileType xml        set ts=2 sw=2 expandtab autoindent
autocmd FileType xslt       set ts=2 sw=2 expandtab autoindent
autocmd FileType htmldjango set ts=2 sw=2 expandtab autoindent
autocmd FileType rst        set ts=2 sw=2 expandtab autoindent
autocmd FileType yaml       set ts=2 sw=2 expandtab autoindent
autocmd FileType css        set ts=2 sw=2 expandtab autoindent

" programming languages
autocmd FileType javascript set ts=4 sw=4 expandtab autoindent number
autocmd FileType php        set ts=4 sw=4 expandtab autoindent number
autocmd FileType ruby       set ts=4 sw=4 expandtab autoindent number
autocmd FileType python     set ts=4 sw=4 expandtab autoindent number
autocmd FileType python     set foldmethod=indent fdl=99
autocmd FileType python     set omnifunc=pythoncomplete#Complete

autocmd BufRead *.json      set ts=2 sw=2

" Automatically chmod +x Shell and Perl scripts
autocmd BufWritePost    *.sh    !chmod +x %
autocmd BufWritePost    *.pl    !chmod +x %

" don't show help when F1 is pressed
map <F1> <ESC>
"ignoremap <F1> <ESC>

" tabs in python are bad!
autocmd FileType python	highlight Tabs ctermbg=red guibg=red
autocmd FileType python match Tabs /^\t+/

" Open file at last edited location
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
					 \ exe "normal g'\"" | endif

map ,# :s/^/#/<CR>:noh<CR>
map ," :s/^/"/<CR>:noh<CR>
map ,/ :s/^/\/\//<CR>:noh<CR>
map ,> :s/^/> /<CR>:noh<CR>
map ,! :s/^/!/<CR>:noh<CR>
map ,; :s/^/;/<CR>:noh<CR>
map ,- :s/^/--/<CR>:noh<CR>

map ,d <esc>oimport ipdb; ipdb.set_trace()<esc>:w<CR>

" Common Command Typos
command! Q  quit    " converts ... :Q  => :q
command! W  write   " converts ... :W  => :w
command! Wq wq      " converts ... :Wq => :wq
command! WQ wq      " converts ... :Wq => :wq
command! Wn wn      " converts ... :Wn => :wn
command! WN wN      " converts ... :WN => :wN

" misc. keymaps
noremap <S-j> <C-f>
noremap <S-k> <C-b>
noremap <C-j> :join<CR>

autocmd BufRead * syntax on
autocmd VimEnter !togglecaps off

if exists("PIDA_EMBEDDED")
  :colorscheme desert
endif
