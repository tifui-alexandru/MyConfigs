set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4 

" autocmd VimEnter * NERDTree

set laststatus=2
set tabline=%F\ %y

set mouse+=a
set ttymouse=sgr
" set autochdir

" set textwidth=80

nnoremap <leader>pv :Ex<CR>

set hlsearch
set number
set relativenumber

set autoread

set nocompatible
filetype off
call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'jupyter-vim/jupyter-vim'
Plug 'untitled-ai/jupyter_ascending.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'phanviet/vim-monokai-pro'
Plug 'tamarin-prover/editors'
call plug#end()
filetype plugin indent on

" Color scheme
" set termguicolors
" colorscheme monokai_pro

set hidden

let g:ale_linters = {
\   'python': ['flake8', 'mypy', 'pylint', 'pyright', 'ruff'],
\}

let g:ale_warn_about_trailing_whitespace = 0"

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_hover = "" 

" # For replacing words ... needs to be done before remapping "
xnoremap <leader>p "_dP<cr>

" # Copy from vim clipboard to system clipboard
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

" # Close brackets automatically, with return
inoremap {<cr> {<cr>}<C-O><S-O>
inoremap (<cr> (<cr>)<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
" # Close brackets without return
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
" # Two cases below are covered by inoremap <exp>
" inoremap " ""<left>
" inoremap ' ''<left>
" # If you close a bracket that is already closed, it overwrites
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"<left>"
" # enclose a word in normal mode with "'({[
nnoremap ' mmbi'<esc>ea'<esc>`m<right>
nnoremap " mmbi"<esc>ea"<esc>`m<right>
nnoremap ( mmbi(<esc>ea)<esc>`m<right>
nnoremap { mmbi{<esc>ea}<esc>`m<right>
nnoremap [ mmbi[<esc>ea]<esc>`m<right>
" # enclose a selection in visual mode with "'({[
vnoremap ' <Esc>`<i'<Esc>`>a<right>'<Esc>
vnoremap " <Esc>`<i"<Esc>`>a<right>"<Esc>
vnoremap ( <Esc>`<i(<Esc>`>a<right>)<Esc>
vnoremap { <Esc>`<i{<Esc>`>a<right>}<Esc>
vnoremap [ <Esc>`<i[<Esc>`>a<right>]<Esc>

set pastetoggle=<F2>

" # FZF mappings
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" YCM hack that solves 'NoExtraConfDetected: No .ycm_extra_conf.py file detected'
let g:ycm_global_ycm_extra_conf = '/home/atifui/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Map YouCompleteMe shortcut

nnoremap <silent> <Plug>YcmMappingGetType :YcmCompleter GetType<CR>
            \ :call repeat#set("\<Plug>YcmMappingGetType")<CR>
nnoremap <silent> <Plug>YcmMappingFixIt :YcmCompleter FixIt<CR>
            \ :call repeat#set("\<Plug>YcmMappingFixIt")<CR>
nnoremap <silent> <Plug>YcmMappingGoTo :YcmCompleter GoTo<CR>
            \ :call repeat#set("\<Plug>YcmMappingGoTo")<CR>
nnoremap <silent> <Plug>YcmMappingGetDoc :YcmCompleter GetDoc<CR>
            \ :call repeat#set("\<Plug>YcmMappingGetDoc")<CR>
nnoremap <silent> <Plug>YcmMappingGoToReferences :YcmCompleter GoToReferences<CR>
            \ :call repeat#set("\<Plug>YcmMappingGoToReferences")<CR>

nmap <silent> gd   <Plug>YcmMappingGoTo
nmap <silent> sd   <Plug>YcmMappingGetDoc
nmap <silent> gr   <Plug>YcmMappingGoToReferences
nnoremap <leader>ygS
            \ :<C-u>execute 'YcmCompleter GoToSymbol '.input('Symbol: ')<CR>
nnoremap <leader>ygs
            \ :<C-u>execute 'YcmCompleter GoToSymbol '.input('Symbol: ')<CR>

nmap <leader>D <Plug>(YCMHover)
nmap <localleader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <localleader>yfd <Plug>(YCMFindSymbolInDocument)
nmap <localleader>ygd <Plug>(YCMPEditDefinition)
nmap <silent> <localleader>h <Plug>(YCMToggleInlayHints)
nnoremap <silent> <localleader>ysd <cmd>YcmShowDetailedDiagnostic<CR>

" I hever use i_CTRL-E and i_CTRL-Y. While i hate overriding the builtin
" function, this is more common for me.
inoremap <silent> <C-E> <Plug>(YCMToggleSignatureHelp)

augroup CustYCMHover
  autocmd!
  autocmd FileType c,cpp,objc let b:ycm_hover = {
        \ 'command': 'GetDoc',
        \ 'syntax': &syntax
        \ }
augroup END

" vimdiff highliting colors
if &diff
  highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
  highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
  highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
  highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=23
endif
