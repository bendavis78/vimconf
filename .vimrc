" defaults
:set ts=4 sw=4 ai encoding=utf-8 et
:set pastetoggle=<F8>
:set background=dark
:set nowrap
:set hlsearch
:set viminfo='20,\"1000
:set nofoldenable

" disable the annoying HTML link underlining
:hi link htmlLink NONE
:hi link htmlItalic NONE

" enable mouse
:set mouse=a

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
syntax on
endif

" set filetypes based on extension
autocmd BufRead *.html      set filetype=htmldjango
autocmd BufRead .bash*      set filetype=sh
autocmd BufRead *.json      set filetype=javascript
autocmd BufRead *.less      set filetype=less


filetype plugin on

" markup languages
autocmd FileType xml        set ts=2 sw=2 expandtab autoindent
autocmd FileType xslt       set ts=2 sw=2 expandtab autoindent
autocmd FileType htmldjango set ts=2 sw=2 expandtab autoindent
autocmd FileType html       set ts=2 sw=2 expandtab autoindent
autocmd FileType rst        set ts=2 sw=2 expandtab autoindent
autocmd FileType yaml       set ts=2 sw=2 expandtab autoindent
autocmd FileType css        set ts=2 sw=2 expandtab autoindent
autocmd FileType less       set ts=2 sw=2 expandtab autoindent

" programming languages
autocmd FileType javascript set ts=2 sw=2 expandtab autoindent number foldmethod=manual
autocmd FileType php        set ts=4 sw=4 expandtab autoindent number
autocmd FileType ruby       set ts=4 sw=4 expandtab autoindent number
autocmd FileType python     set ts=4 sw=4 expandtab autoindent number
autocmd FileType python     set foldmethod=indent fdl=99
autocmd FileType python     set omnifunc=pythoncomplete#Complete

autocmd BufRead *.json      set ts=2 sw=2

" Automatically chmod +x Shell and Perl scripts
"autocmd BufWritePost    *.sh    !chmod +x %
"autocmd BufWritePost    *.pl    !chmod +x %

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
map ,t :ConqueTermSplit bash<CR>
map ,vt :ConqueTermVSplit bash<CR>
map ,f :FF<CR>

" Train myself not to use the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

" Quickly close preview windows
map ,c :pclose<CR>

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
map ,j :join<CR>
noremap <C-Space> <C-X><C-O><CR>

noremap <C-h> :wincmd h<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>
noremap <C-l> :wincmd l<CR>

" clear hilighting
noremap <F3> :nohl<CR>

autocmd BufRead * syntax on
autocmd VimEnter !togglecaps off

" Underline errors in red, hilight is too distracting
highlight SpellBad ctermbg=none ctermfg=red cterm=underline,bold gui=undercurl

" Better Pmenu
highlight Pmenu term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
highlight PmenuSel term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
highlight PmenuSbar term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
highlight PmenuThumb term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White

" Ctrl+Space omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


" 256 colors
"set t_Co=256

" Save using sudo
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null" |silent edit!

" Gist settings
let g:gist_detect_filetype=2
let g:github_user="bendavis78"
let g:github_token="c0a537557dc36a5e91bb100862c055ac"
