" Lightweight vimrc settings for console systems and GUI

" Basic options

" Vim settings {{{1

set smartindent
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set ignorecase
set smartcase
set textwidth=80
set formatoptions+=r
set cinoptions=:0g0
set backspace=2
set mouse=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set clipboard=unnamed
set encoding=utf-8
set hlsearch
set incsearch
set breakindent
set breakindentopt=sbr
set showbreak=▓▓▓▓
set grepprg=grep\ -nH\ $*
set completeopt-=preview
set path+=/usr/local/include

syntax on
filetype plugin on
filetype plugin indent on

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

let g:tex_flavor='latex'
let g:is_posix = 1
let g:load_doxygen_syntax=1
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1

" }}}

" Keybinds {{{1

" Map redraw screen (C-L) to also turn of search highlighting. {{{2
nnoremap <C-l> :nohl<CR><C-l>

" Jump back to previous/next -- easier and avoid conflict with <C-I> (Tab) {{{2
nnoremap <Leader>o <C-O>
nnoremap <Leader>i <C-I>

" Disable v_u/v_U keybinds {{{2
vnoremap u <Nop>
vnoremap U <Nop>

" Tweaks {{{1

" Automatically change to directory of file {{{2
autocmd BufEnter * silent! lcd %:p:h

" Show NFOs in correct codepage {{{2
au BufNewFile,BufRead *.nfo edit ++enc=cp437

" Delete trailing whitespace in code {{{2
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,glsl,cmake autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }}}

" Color scheme {{{1
let g:force_greyComments=1
set background&
colo force
" }}}

" Plugins {{{1

let g:plug_home = (split(&rtp, ',')[0]) . '/bundle'
call plug#begin()

Plug 'junegunn/vim-plug'

Plug 'othree/html5.vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" delimitMate {{{2
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
au FileType vim let b:delimitMate_quotes="'" 
" }}}

" Vim indent guides {{{2
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
" }}}

" XMLEdit {{{2
Plug 'sukima/xmledit'
let g:xmledit_enable_html = 1
" }}}

" SnipMate {{{2
Plug 'garbas/vim-snipmate'
Plug 'Symaxion/vim-snippets'
let g:snipMate = {}
let g:snipMate.snippet_version = 0
" }}}


call plug#end()

" }}}

" vim: fdm=marker
