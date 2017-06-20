set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle {{{
  Plugin 'gmarik/vundle'

  " github repos {{{

  " Powerline
  "
  Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

  " General plugins
  "
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/syntastic'
  Plugin 'tomtom/tlib_vim'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'tomtom/tselectbuffer_vim'
  Plugin 'Townk/vim-autoclose'
  Plugin 'majutsushi/tagbar'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'wincent/command-t'

  " Tools and Documentation
  "
  Plugin 'mileszs/ack.vim'
  Plugin 'gregsexton/gitv'

  " Syntax support
  "
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'ingydotnet/yaml-vim'

  " Themes and colors
  "
  Plugin 'flazz/vim-colorschemes'
  Plugin 'trapd00r/x11colors.vim'
  Plugin 'lilydjwg/colorizer'
  Plugin 'zeis/vim-kolor'

  " Rust Support
  "
  Plugin 'rust-lang/rust.vim'
  Plugin 'racer-rust/vim-racer'

  " Completion
  "
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'

  " }}}

  " vim-scripts repos {{{
  " }}}

  " non github repos {{{
  " }}}

" }}}

call vundle#end()
filetype plugin indent on

" General settings {{{
  filetype on
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

  set background=dark

  set hidden            " buffer switching should be quick
  set confirm           " ask instead of just print errors
  set equalalways       " make splits equal size

  set lazyredraw        " don't redraw while executing macros

  set noshowmode        " don't display mode, it's already in the status line

  let mapleader=","
  let maplocalleader=","
" }}}

" General Keybinds {{{
  " Delete previous word with C-BS
  imap <C-BS> <C-W>

  " Toggle Buffer Selection and list Tag Lists
  map <F2> <Esc>:TSelectBuffer<CR>
  map <F4> <Esc>:CommandT<CR>
  map <F6> <Esc>:TagbarToggle<CR>

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

" GUI {{{
  if has('gui_running')
    set guicursor+=a:blinkon0       " Cursor doesn't blink
    set guioptions-=m               " No Menubar
    set guioptions-=T               " No Toolbar
    set guioptions-=l               " No Scrollbar left
    set guioptions-=L               " No Scrollbar left when split
    set guioptions-=r               " No Scrollbar right
    set guioptions-=r               " No Scrollbar right when split

    set laststatus=2                " always show statusline

    set lines=40                    " Height
    set columns=85                  " Width

    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%101v', 120)

    let g:kolor_italic=1                    " Enable italic. Default: 1
    let g:kolor_bold=1                      " Enable bold. Default: 1
    let g:kolor_underlined=0                " Enable underline. Default: 0
    let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

    colorscheme jellybeans

  else
    colorscheme jellybeans
  endif
" }}}

" Invisibles {{{
  set listchars=tab:>\ ,eol:<
  nmap <silent> <F5> :set list!<CR>
" }}}

" Folds {{{
  set foldmethod=marker
  set foldcolumn=1
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

" NERDTree {{{
  map <F3> :NERDTreeToggle<CR>

  let NERDTreeChDirMode = 2
  let NERDTreeShowBookmarks = 1
" }}}

" Git Diff {{{
  map <F9> :GitGutterToggle<CR>
  map <F10> :GitGutterLineHighlightsToggle<CR>
  highlight GitGutterAddLine guibg=#181d26
  highlight GitGutterChangeLine guibg=#181828
  highlight GitGutterDeleteLine guibg=#381c20
  highlight GitGutterChangeDeleteLine guibg=#181818
" }}}

" {{{ Powerline
  set guifont=Terminus\ for\ Powerline:h16
  let g:Powerline_symbols = 'unicode'
  set encoding=utf-8
  set linespace=0
  set fillchars+=stl:\ ,stlnc:\
  set term=rxvt-256color
  set termencoding=utf-8
" }}}

" {{{ Rust Configs
  let g:rustfmt_autosave = 1
  let g:racer_cmd = "/home/abronan/.cargo/bin/racer"
" }}}

" Wrapping {{{
  set linebreak
  set showbreak=↳\
" toggle wrapping
  nmap <silent> <F12> :let &wrap = !&wrap<CR>
" }}}

" 'Bubbling' {{{
  nmap <C-up> [e
  nmap <C-down> ]e
  vmap <C-up> [egv
  vmap <C-down> ]egv
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

" UltiSnips {{{
  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:ulti_expand_or_jump_res = 0
  function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    else
      return "\<CR>"
    endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
  let g:ycm_key_list_select_completion = ['<TAB>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>']
" }}}

" YCM {{{
  let g:ycm_server_python_interpreter = '/usr/bin/python2'
" }}}

" Tabstops {{{
  set softtabstop=4
  set shiftwidth=4
  set autoindent
  set smartindent
  set expandtab
" }}}
