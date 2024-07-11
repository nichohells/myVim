set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
Plug 'tmsvg/pear-tree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-black-formatter', {'do': 'yarn install --frozen-lockfile'}
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-dadbod'
Plug 'mattn/emmet-vim'
Plug 'preservim/tagbar'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'strboul/urlview.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tell-k/vim-autopep8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'

" Wilder
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

endif
call plug#end()

" ---.vimrc----------------------------

" who needs telescope
nnoremap <leader>ff :Files<Cr>
nnoremap <leader>bf :Buffers<Cr>

set background=light

syntax enable

set number

setlocal relativenumber
let g:goyo_linenr = 1

let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

set clipboard=unnamedplus

augroup netrw_settings
  autocmd!
  " Ensure absolute numbers in netrw buffers
  autocmd FileType netrw setlocal number norelativenumber
  " Ensure relative numbers in all other buffers
  autocmd BufEnter * if &filetype != 'netrw' | setlocal relativenumber | endif
augroup END


" Navigate through quickfix list and location list
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

nmap <F8> :TagbarToggle<CR>

set numberwidth=5

" Run Go file
au FileType go map <leader>go :!go run %<CR>

" Entire file ocurrences
nnoremap <leader>rn :%s/\<<C-r><C-w>\>//<Left>

" Set up key mapping for changing file permissions
nnoremap <leader>x :!chmod +x %<CR>

" Move the selected lines in visual mode down one line
vnoremap J :m '>+1<CR>gv=gv

" Move the selected lines in visual mode up one line
vnoremap K :m '<-2<CR>gv=gv

" Join the current line with the line below and put the cursor at the end of the joined line
nnoremap J mzJ`z

" Move to the next search result and center the cursor on the screen
nnoremap n nzzzv

" Move to the previous search result and center the cursor on the screen
nnoremap N Nzzzv

" Deprecating a horrible function
nnoremap Q <Nop>


" Configure file handling and undo behavior
set noswapfile
set nobackup
let &undodir = expand('$HOME') . '/.vim/undodir'
set undofile

" Configure search behavior
set nohlsearch
set incsearch

" Define a custom statusline format
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Set custom statusline colors
highlight StatusLine guibg=#333333 guifg=#ffffff

" Ensure statusline is always shown
set laststatus=2

" Adjust buffer appearance
set scrolloff=8
set signcolumn=yes

" Adjust isfname setting to include "@-@"
set isfname+=@-@

" Set updatetime to trigger swap file write
set updatetime=50

" Set color column at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#333333

" Toggle DBUI
nnoremap <F10> :DBUIToggle<CR>

" URL-VIEW
nnoremap <silent> <leader>u :Urlview<CR>

autocmd FileType html let g:indent_blankline_filetype = ['html']

" Center the screen after scrolling up/down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Center the screen after searching
nnoremap n nzz
nnoremap N Nzz

" Move to the next buffer using Ctrl + l
nnoremap <C-l> :bn<CR>

" Move to the previous buffer using Ctrl + h
nnoremap <C-h> :bp<CR>

" UndotreeToggle
nnoremap <F5> :UndotreeToggle<CR>

" netrw
nnoremap <leader>n :Lex<cr>:vertical resize 30<cr>
vnoremap <leader>n :Lex<cr>:vertical resize 30<cr>
noremap <leader>pv :Explore<CR>

set foldmethod=indent

set foldlevel=99

" Cut the selected text to the clipboard
vnoremap cx "+x
nnoremap cx "+dd

" My own vim-surround
" Parentheses
xmap sp <Esc>`>a)<Esc>`<i(
" Brackets
xmap sb <Esc>`>a]<Esc>`<i[
" Single quotes
xmap sq <Esc>`>a'<Esc>`<i'
" Double quotes
xmap s" <Esc>`>a"<Esc>`<i"

" Angle brackets
xmap s< <Esc>`>a><Esc>`<i<
xmap s> <Esc>`>a><Esc>`<i>

let g:AutoPairsFlyMode = 0

set backspace=indent,eol,start  " more powerful backspacing

" Identation settings
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent

" CoC Config at the end of the file

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

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call 	CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call 	CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline

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

function! FormatWithClangFormat()
    " Save any pending changes to the buffer
    update

    " Run clang-format with specified options
    silent execute "!clang-format -style=\"{BasedOnStyle: llvm, IndentWidth: 4, UseTab: Always}\" -i " . shellescape(expand("%"))

    " Reload the buffer to reflect formatting changes
    edit
endfunction

autocmd BufWritePre *.c,*.h call FormatWithClangFormat()

nnoremap <leader>fp :call CocAction('format')<CR>

" vim-go configuration
let g:go_fmt_fail_silently = 1
let g:go_doc_keywordprg_enabled = 0

" dense-analysis-ale configuration
" Specify which linters to run for each filetype
let g:ale_linters = {
\   'html': ['htmlhint'],
\}

" Specify which fixers to run for each filetype
let g:ale_fixers = {
\   '*': ['prettier'],
\}

let g:ale_linters = {
  \ 'html': ['tsserver'],
\ }

" Run fixers on file save
let g:ale_fix_on_save = 1

" Disable linting on text change and insert leave
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Enable linting on file save only
let g:ale_lint_on_save = 1

" Use Ctrl-n for next and Ctrl-p for previous in the suggestions list
" Default keys
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<C-n>',
      \ 'previous_key': '<C-p>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
" 'border'            : 'single', 'double', 'rounded' or 'solid'
"                     : can also be a list of 8 characters,
"                     : see :h wilder#popupmenu_border_theme() for more details
" 'highlights.border' : highlight to use for the border`
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ })))
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))


