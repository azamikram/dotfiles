set nocompatible " not vi compatible

" Theme
packadd! dracula
colorscheme dracula

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on " enable file type detection
set autoindent

"---------------------
" Basic editing config
"---------------------
set shortmess+=I " disable startup message
set nu " number lines
set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
" remove search highlight once done
nnoremap <Leader><space> :nohlsearch<CR>
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
" add custom tags filename
set tags+=./.ctags
" recursvly search tags file
set tags=./.ctags;$HOME

"--------------------
" Misc configurations
"--------------------

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" movement relative to display lines
nnoremap <silent> <Leader>d :call ToggleMovementByDisplayLines()<CR>
function SetMovementByDisplayLines()
    noremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
    noremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction
function ToggleMovementByDisplayLines()
    if !exists('b:movement_by_display_lines')
        let b:movement_by_display_lines = 0
    endif
    if b:movement_by_display_lines
        let b:movement_by_display_lines = 0
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
    else
        let b:movement_by_display_lines = 1
        call SetMovementByDisplayLines()
    endif
endfunction

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" spell checking
set spelllang=en
" use the following to make spell check enable by default
" set spell
" Make F5 toggle spell check
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>
" Use ]s pr [s to move between wrong words and use z= to
" see the suggestion for the wrong spell word

"---------------------
" Plugin configuration
"---------------------

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>

" ctrlp
nnoremap <Leader>; :CtrlP<CR>
nnoremap <Leader>. :CtrlPTag<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" easymotion
map <Space> <Plug>(easymotion-prefix)

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" tagbar
nmap <F8> :TagbarToggle<CR>

" ack.vim, require `ag` (the silver searcher)
" fixes the issue of ack printing the outputi of ag to console
" copied from https://github.com/mileszs/ack.vim/issues/18
function Search(string) abort
    let saved_shellpipe = &shellpipe
    let &shellpipe = '>'
     try
        execute 'Ack!' shellescape(a:string, 1)
    finally
        let &shellpipe = saved_shellpipe
    endtry
endfunction

nnoremap <Leader>f :call Search("")<left><left>
let g:ackprg = 'ag --nogroup --nocolor --column --silent'
let g:ackhighlight = 1

" enable project-specific .vimrc
set exrc
set secure
