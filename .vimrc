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
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" let g:ycm_global_ycm_extra_conf = '/home/atifui/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Map YouCompleteMe shortcut

" nnoremap <silent> <Plug>YcmMappingGetType :YcmCompleter GetType<CR>
"             \ :call repeat#set("\<Plug>YcmMappingGetType")<CR>
" nnoremap <silent> <Plug>YcmMappingFixIt :YcmCompleter FixIt<CR>
"             \ :call repeat#set("\<Plug>YcmMappingFixIt")<CR>
" nnoremap <silent> <Plug>YcmMappingGoTo :YcmCompleter GoTo<CR>
"             \ :call repeat#set("\<Plug>YcmMappingGoTo")<CR>
" nnoremap <silent> <Plug>YcmMappingGetDoc :YcmCompleter GetDoc<CR>
"             \ :call repeat#set("\<Plug>YcmMappingGetDoc")<CR>
" nnoremap <silent> <Plug>YcmMappingGoToReferences :YcmCompleter GoToReferences<CR>
"             \ :call repeat#set("\<Plug>YcmMappingGoToReferences")<CR>

" nmap <silent> gd   <Plug>YcmMappingGoTo
" nmap <silent> sd   <Plug>YcmMappingGetDoc
" nmap <silent> gr   <Plug>YcmMappingGoToReferences
" nnoremap <leader>ygS
"             \ :<C-u>execute 'YcmCompleter GoToSymbol '.input('Symbol: ')<CR>
" nnoremap <leader>ygs
"             \ :<C-u>execute 'YcmCompleter GoToSymbol '.input('Symbol: ')<CR>

" nmap <leader>D <Plug>(YCMHover)
" nmap <localleader>yfw <Plug>(YCMFindSymbolInWorkspace)
" nmap <localleader>yfd <Plug>(YCMFindSymbolInDocument)
" nmap <localleader>ygd <Plug>(YCMPEditDefinition)
" nmap <silent> <localleader>h <Plug>(YCMToggleInlayHints)
" nnoremap <silent> <localleader>ysd <cmd>YcmShowDetailedDiagnostic<CR>

" I hever use i_CTRL-E and i_CTRL-Y. While i hate overriding the builtin
" function, this is more common for me.
" inoremap <silent> <C-E> <Plug>(YCMToggleSignatureHelp)
" 
" augroup CustYCMHover
"   autocmd!
"   autocmd FileType c,cpp,objc let b:ycm_hover = {
"         \ 'command': 'GetDoc',
"         \ 'syntax': &syntax
"         \ }
" augroup END

" vimdiff highliting colors
if &diff
  highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
  highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
  highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
  highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=23
endif

set shortmess-=S

" VIM COC stuff
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>s  <Plug>(coc-format-selected)
nmap <leader>s  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> to scroll float windows/popups
 "if has('nvim-0.4.0') || has('patch-8.2.0750')
  " nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  " nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  " inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  " inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  " vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  " vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 "endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"Chat GPT generated color shceme that works with Monokai Pro

" CocFloating: Background color should be a dark shade, with bold text
highlight CocFloating cterm=BOLD ctermfg=NONE ctermbg=235 guibg=#2D2A2E guifg=NONE

" CocFloatDividingLine: Use a slightly lighter shade to differentiate
highlight CocFloatDividingLine cterm=BOLD ctermfg=NONE ctermbg=236 guibg=#403E41 guifg=NONE

" CocFloatActive: Active item should stand out more, so use a brighter background
highlight CocFloatActive cterm=BOLD ctermfg=NONE ctermbg=240 guibg=#75715E guifg=NONE

" CocMenuSel: Selected menu item should have a high contrast
highlight CocMenuSel cterm=BOLD ctermfg=NONE ctermbg=105 guibg=#FFD866 guifg=NONE
