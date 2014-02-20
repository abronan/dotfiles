set ts=4 sw=4 sts=4 expandtab "for tab key : use spaces, no tabs
set nu
set title
set mouse=a
set hidden  "allow change buffer without save
set confirm "ask to save the current unsaved file
set showcmd "show cmd being typing"
set clipboard=autoselectplus,unnamedplus "easy window clipboard sharing
set report=0 "number of substitutions done with :s cmd, instead of number of lines
set showmatch matchtime=2 "when close a bracket, show where it was opened

"colors
syntax on
set background=dark
set t_Co=256 "color 256

"store .swp in a tmp dir
silent! call mkdir(expand("~")."/.vim/tmp", "p") "create the tmp directory
set directory=~/.vim/tmp

"scroll
set scrolloff=2 " number of screen lines to keep above and below the cursor
set sidescrolloff=2 " same for columns

"last column is 80
"set colorcolumn=81 "i have to recompile my vim to use this bitch
set textwidth=79 "a longer line will be broken after white space
set linebreak "wrap long lines at characters in break rather than only width

"detect filetype 
filetype on
filetype plugin on
filetype indent on

"encoding
set ffs=unix,dos,mac "support EOL foreach system
set fileencodings=utf-8,latin1 "the encoding of the file
set encoding=utf-8

"search
set ignorecase
set smartcase
set magic "dunno

"printing
"set printoptions=paper:a4 " set the paper size
"set printdevice=HP_psc_1300_series_USB_MY48GD80F29F_HPLIP
"set printoptions+=syntax:y "do syntax highlighting when printing

"matching NBSPs (show unbreak space)
highlight NbSp ctermbg=blue guibg=blue
match NbSp / /

"alternate
let g:alternateNoDefaultAlternate = 1 "don't create the file
let g:alternateSearchPath='reg:#source#include/tbr##,reg:#source#include/gltb##,sfr:../../source'

"abbreviations
iabbrev println System.out.println

"emacs bidings in command mode
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <M-BS> <S-left><Delete>
cnoremap <Esc><BS> <S-left><Delete>
cnoremap <C-g>  <C-c>

"wildignore
set wildignore+=*.o,*.dll,*.obj,*.exe,*.pyc,*.a,*.class,*.mo,*.la,*.so,*.obj
set wildignore+=*~,*.bak
set wildignore+=*.jpg,*.gif,*.png,*.xpm
set wildignore+=*.swp
set wildignore+=.svn,CVS,.git
set wildignore+=doc*,build*,cmake,resources

"ctags, taglist plugin
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"nnoremap <silent> <F8> :TlistToggle<CR>
"set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)
"let Tlist_Process_File_Always=1
"let Tlist_Inc_Winwidth=0

"could be usefull some day
"set backspace=2 "allow to backspace indent,eol,start
"set lazyredraw "usefull for macros

