"
"   .VIMRC dotfile
"   
"   @author:    abronan
"   @updated:   Sa 13 Jul 2014
"   @revision:  2

set nocompatible

" Vundle {{{
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#rc()

  " let Vundle manage Vundle
  Bundle 'gmarik/vundle'

  " Vundles
  "
  " github repos
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-rails'
  Bundle 'tpope/vim-haml'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-ragtag'
  Bundle 'tpope/vim-markdown'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/syntastic'
  Bundle 'gregsexton/gitv'
  Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
  Bundle 'msanders/snipmate.vim'
  Bundle 'ervandew/supertab'
  Bundle 'tomtom/tlib_vim'
  Bundle 'tomtom/tcomment_vim'
  Bundle 'tomtom/tselectbuffer_vim'
  Bundle 'vim-scripts/taglist.vim'
  Bundle 'Townk/vim-autoclose'
  Bundle 'trapd00r/x11colors.vim'
  Bundle 'lilydjwg/colorizer'
  Bundle 'zeis/vim-kolor'
  Bundle 'fatih/vim-go'
  Bundle 'shemerey/vim-project'
  Bundle 'majutsushi/tagbar'
  Bundle 'mileszs/ack.vim'
  Bundle 'tomasr/molokai'
  Bundle 'flazz/vim-colorschemes'
  " Bundle 'Valloric/YouCompleteMe'

  " vim-scripts repos

  " non github repos

" }}}
" General settings {{{
  filetype on
  filetype plugin indent on
  syntax on

  set relativenumber

  set t_Co=256

  set title
  set mouse=a

  set shortmess=at      " shorten error messages

  set nrformats+=alpha  " in-/decrease letters with C-a/C-x

  set modeline          " enable modelines
  set modelines=5

  set number            " enable line numbers
  set ruler             " enable something
  set cursorline        " enable highlighting of cursor line

  set backspace=2       " backspace over EOL etc.

  set background=dark   " i prefer dark backgrounds

  set hidden            " buffer switching should be quick
  set confirm           " ask instead of just print errors
  set equalalways       " make splits equal size

  set lazyredraw        " don't redraw while executing macros

  set noshowmode        " don't display mode, it's already in the status line

  let mapleader=","
  let maplocalleader=","
" }}}
" General Keybinds {{{

  " Set MapLeader
  let mapleader = ","

  " Delete previous word with C-BS
  imap <C-BS> <C-W>

  " Toggle Buffer Selection and list Tag Lists
  map <F2> <Esc>:TSelectBuffer<CR>
  map <F4> <Esc>:TlistToggle<CR>
  map <F6> <Esc>:TagbarToggle<CR>
  " map <F7> <Esc>:CommandT<CR>
   
  " Set text wrapping toggles
  nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR> 
   
  " Set up retabbing on a source file
  nmap <silent> <leader>rr :1,$retab<CR> 
   
  " cd to the directory containing the file in the buffer
  nmap <silent> <leader>cd :lcd %:h<CR> 
   
  " Make the directory that contains the file in the current buffer.
  " This is useful when you edit a file in a directory that doesn't
  " (yet) exist
  nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

  " Increase @revision # by 1
  nmap <silent> <leader>incr /@updated wwwd$"=strftime("%a %d %b %Y") p/@revision $
" }}}
" {{{ Window movement
  nmap <M-h> :winc h<CR>
  nmap <M-j> :winc j<CR>
  nmap <M-k> :winc k<CR>
  nmap <M-l> :winc l<CR>
" }}}
" GUI or no GUI, that's the question {{{
  if has('gui_running')
    set guicursor+=a:blinkon0       " Cursor doesn't blink - it's annoying
    set guioptions-=m               " No Menubar
    set guioptions-=T               " No Toolbar
    set guioptions-=l               " No Scrollbar left
    set guioptions-=L               " No Scrollbar left when split
    set guioptions-=r               " No Scrollbar right
    set guioptions-=r               " No Scrollbar right when split

    set laststatus=2                " always show statusline

    " set gfn=Pragmata\ 6.5
    set gfn=Neep\ Medium\ Semi-Condensed\ 9
    " set gfn=Mensch\ 7

    set lines=40                    " Height
    set columns=85                  " Width

    let g:kolor_italic=1                    " Enable italic. Default: 1
    let g:kolor_bold=1                      " Enable bold. Default: 1
    let g:kolor_underlined=0                " Enable underline. Default: 0
    let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

    colorscheme Tomorrow-Night

  else
    colorscheme Tomorrow-Night-Bright
  endif
" }}}
" Tabstops {{{
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set autoindent
  set smartindent
  set expandtab
" }}}
" Invisibles {{{
  set listchars=tab:>\ ,eol:<
  nmap <silent> <F5> :set list!<CR>
" }}}
" Folds {{{
  set foldmethod=marker
  set foldcolumn=1
  " au BufWinLeave * mkview
  " au BufWinEnter * silent loadview
" }}}
" Pairings {{{
  set showmatch
" }}}
" Margins {{{
  set scrolloff=5
  set sidescroll=5
" }}}
" Search {{{
  set incsearch
  set ignorecase

  " Toggle that stupid highlight search
  nmap <silent> ,n :set invhls<CR>:set hls?<CR> 
" }}}
" Backup files {{{
  set nobackup
  set nowb
  set noswapfile
" }}}
" Completion {{{
  set wildmenu
  set wildmode=longest,full,list

  set ofu=syntaxcomplete#Complete
" }}}
" Snipmate {{{
  imap <tab> <C-r>=TriggerSnippet()<CR>
" }}}
" NERDTree {{{
  map <F3> :NERDTreeToggle<CR>

  let NERDTreeChDirMode = 2
  let NERDTreeShowBookmarks = 1
" }}}
" {{{ Powerline
  set guifont=Inconsolata\ for\ Powerline:h13
  let g:Powerline_symbols = 'fancy'
  set encoding=utf-8
  set fillchars+=stl:\ ,stlnc:\
  set term=xterm-256color
  set termencoding=utf-8
  
  "" MacVim specific
  if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h13
    endif
  endif
" }}}
" Wrapping {{{
  set linebreak
  set showbreak=↳\ 
" toggle wrapping
  nmap <silent> <F12> :let &wrap = !&wrap<CR>
" }}}
" RagTag {{{
  imap <M-O> <Esc>o
  imap <C-J> <Down>
  let g:ragtag_global_maps = 1

  imap <C-Space> <C-X><Space>
  imap <C-CR> <C-X><CR>
" }}}
" 'Bubbling' {{{
  nmap <C-up> [e
  nmap <C-down> ]e
  vmap <C-up> [egv
  vmap <C-down> ]egv
" }}}
" Formatting with Par (gqip) {{{
  set formatprg=par\ -req
  nmap <F9> gqip
" }}}
" Pasting {{{
  set paste
  nnoremap p ]p
  nnoremap <c-p> p
" }}}
" Macros {{{
  " Execute macro "q" with space
  nmap <Space> @q
  " Map @ to + for more comfortable macros on DE kb layout
  nmap + @
" }}}
