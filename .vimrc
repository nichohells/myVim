set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
Plug 'shrikecode/kyotonight.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jiangmiao/auto-pairs'
Plug 'github/copilot.vim'
Plug 'ziglang/zig.vim'
Plug 'mattn/emmet-vim'
Plug 'rose-pine/vim'
Plug 'rhysd/committia.vim'
Plug 'ycm/harpy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvie/vim-flake8'
Plug 'yaegassy/coc-black-formatter', {'do': 'yarn install --frozen-lockfile'}
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'
Plug 'mattn/emmet-vim'
Plug 'preservim/tagbar'
Plug 'strboul/urlview.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tell-k/vim-autopep8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
if &filetype == 'sql'
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'
endif

" inactive
" Plug 'tmsvg/pear-tree'

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

nnoremap <silent> <leader>ll :Harpy<cr>
nnoremap <silent> <leader>la :HarpyAdd<cr>

nnoremap <Leader>fd :CocList diagnostics<CR>

set noswapfile

" ColorScheme

"set termguicolors

let g:kyotonight_bold = 1

let g:kyotonight_underline = 1

let g:kyotonight_italic = 0

let g:kyotonight_italic_comments = 0

let g:kyotonight_uniform_status_lines = 0

let g:kyotonight_cursor_line_number_background = 0

let g:kyotonight_uniform_diff_background = 0

let g:kyotonight_lualine_bold = 1

"colorscheme rosepine

" Stop the annoyance and never lose work
nnoremap <c-z> <nop>

" who needs telescope
let g:fzf_vim = {}
nnoremap <leader>ff :Files<Cr>
nnoremap <leader>bf :Buffers<Cr>

" Open linter alerts and errors in horizontal split window
nnoremap <leader>er :lopen<Cr>

autocmd FileType nerdtree setlocal relativenumber
autocmd FileType nerdtree setlocal number
autocmd FileType nerdtree setlocal signcolumn=yes
let g:NERDTreeShowHidden = 1

" Set cursor color to black (replace with your preferred color)
highlight Cursor guifg=NONE guibg=#000000

" Disable CursorLine
autocmd ColorScheme * highlight clear CursorLine

highlight DiagnosticError guifg=#dc322f guibg=NONE  " Red
highlight DiagnosticWarn guifg=#b58900 guibg=NONE  " Yellow
highlight DiagnosticInfo guifg=#2aa198 guibg=NONE  " Cyan
highlight DiagnosticHint guifg=#859900 guibg=NONE  " Green

" Disable cusor highlights match parentheses, etc when under the cursor
let loaded_matchparen = 1

" Automatically save and restore cursor position when switching buffers
augroup remember_cursor_position
    autocmd!
    " Save cursor position
    autocmd BufLeave * if expand('%') != "" | let b:cursorpos = getpos(".") | endif
    " Restore cursor position
    autocmd BufEnter * if exists("b:cursorpos") | call setpos(".", b:cursorpos) | unlet b:cursorpos | endif
augroup END

set background=dark

set cursorline

highlight CursorLineNr cterm=bold gui=bold

"highlight CursorLineNr ctermfg=lightyellow guifg=#fe9e65
highlight CursorLineNr ctermfg=white guifg=#ffffff

" Disable underline on the cursor line
highlight CursorLine gui=NONE cterm=NONE

syntax on

set number

setlocal relativenumber
let g:goyo_linenr = 1

" relativenumber in buffers opened from netrw 
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

" dadbodui toggle
nnoremap <leader>db :DBUIToggle<CR>

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

" Replace word under cursor
nnoremap <leader>rm :s/\<<C-r><C-w>\>//<Left>

" Replace word under cursor for whole file
nnoremap <leader>rf :%s/\<<C-r><C-w>\>//<Left>


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

" Deprecating a horrible feature of fzf vim
autocmd VimEnter * command! -nargs=* Window echohl ErrorMsg | echo "E492: Not an editor command: W" | echohl None

" Configure file handling and undo behavior
" set noswapfile
" set nobackup
let &undodir = expand('$HOME') . '/.vim/undodir'
set undofile

" Configure search behavior
set nohlsearch
set incsearch

" Define a custom statusline format
set statusline=%<[%n]\ %f\ %{BufferModified()}[vim]\%{GitStatus()}\ %h%r%=%-14.(%l,%c%V%)\ %P

function! BufferModified()
    return &modified ? '[+]' : ''
endfunction

function! GitStatus()
    if exists("*FugitiveHead")
        let branch = FugitiveHead()
        return branch != '' ? '[Git(' . branch . ')]' : ''
    endif
    return ''
endfunction

" Set StatusLine background to black and text to white

highlight StatusLine guibg=#000000 guifg=#FFFFFF
highlight StatusLineNC guibg=#FFFFFF guifg=#000000
"highlight StatusLine guibg=#29273e guifg=#918aad
"highlight StatusLineNC guibg=#29273e guifg=#918aad

"highlight Normal ctermbg=none guibg=#FFFFFF
"highlight Normal ctermbg=none guibg=#000000

" Ensure statusline is always shown
set laststatus=2

" Adjust buffer appearance
set scrolloff=8
set signcolumn=yes

" SignColumn for darkness
highlight SignColumn ctermbg=236 guibg=#2c2c2c

" Adjust isfname setting to include "@-@"
set isfname+=@-@

" Set updatetime to trigger swap file write
set updatetime=50

" Set color column at column 80
set colorcolumn=81

"highlight ColorColumn ctermbg=7 guibg=#d4d4d4
highlight ColorColumn ctermbg=236 guibg=#2c2c2c

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

" Nerdtree toggle
nnoremap <C-n> :NERDTreeToggle<Cr>

" netrw
" nnoremap <leader>n :Lex<cr>:vertical resize 30<cr>
" vnoremap <leader>n :Lex<cr>:vertical resize 30<cr>
noremap <leader>pv :NERDTreeExplore<CR>

set foldmethod=indent

set foldlevel=99

" Cut the selected text to the clipboard
vnoremap cx "+x
nnoremap cx "+dd

set clipboard=unnamedplus

nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p

" Delete a single character without affecting the default register
nnoremap x "_x
nnoremap X "_x
nnoremap <Del> "_x

" Delete a line without affecting the default register
nnoremap dd "_dd

" Delete to a motion without affecting the default register
nnoremap d "_d

" Visual mode deletions
vnoremap x "_x
vnoremap X "_x
vnoremap <Del> "_x
vnoremap dd "_dd
vnoremap d "_d

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
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
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

" Use <TAB> to select the completion item if the menu is visible, otherwise use <TAB> for normal behavior

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" Use <C-y> to select the completion item if the menu is visible, otherwise use <C-y> for normal behavior

inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<C-y>"


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

" Example .vimrc configuration for compiling GTK applications with Coc.nvim
let g:cppflags = '-I/usr/include/gtk-3.0/'
let g:ldflags = '`pkg-config --libs gtk+-3.0`'

" Set makeprg to compile with gcc and GTK flags
set makeprg=gcc\ $CPPFLAGS\ -o\ %<\ %\ $LDFLAGS

" function! FormatCpp()
"     " Run clang-format with specified options
"     silent execute "!clang-format -style=\"{BasedOnStyle: llvm, IndentWidth: 4, UseTab: Always}\" -i " . shellescape(expand("%"))
" 
"     " Reload the buffer to reflect formatting changes
"     edit
" endfunction
" 
" autocmd BufWritePre *.c,*.h,*.cpp call FormatWithClangFormat()

nnoremap <leader>fp :call CocAction('format')<CR>

" vim-go configuration
let g:go_fmt_fail_silently = 1
let g:go_doc_keywordprg_enabled = 0

" dense-analysis-ale configuration
" Specify which linters to run for each filetype
let g:ale_linters = {
\   'html': ['htmlhint'],
\}

let g:ale_linters = {
\    'python': ['flake8'],
\}


" Specify which fixers to run for each filetype
let g:ale_fixers = {
\   '*': ['prettier'],
\}

" let g:ale_fixers = {
" \   'python': ['black'],
" \}


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
      \ 'accept_key': '<C-y>',
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

" set fillchars=eob:\ 

" Change Copilot's accept key to <C-y>
imap <silent><script><expr> <F2> copilot#Accept("\<CR>")

" Disable default <Tab> mapping for Copilot
let g:copilot_no_tab_map = v:true

" Toggle copilot with <leader>cp (it is disabled by default)
let g:copilot_enabled = 0

function! ToggleCopilot()
    if g:copilot_enabled
	let g:copilot_enabled = 0
	echo "Copilot disabled."
    else
	let g:copilot_enabled = 1
	echo "Copilot enabled."
    endif
endfunction

nnoremap <leader>cp :call ToggleCopilot()<CR>

" Harpy configuration
function! HarpyJump(index)
    let lines = readfile('.harpylist')
    if a:index >= 1 && a:index <= len(lines)
        execute 'e' lines[a:index - 1]
    else
        echo "Harpy: Invalid index."
    endif
endfunction

function! HarpyAdd(file)
    if empty(a:file)
        let a:file = expand('%:p')  " Use the current file if none is provided
    endif
    if filereadable(a:file) && a:file != ""
        let lines = readfile('.harpylist')
        if index(lines, a:file) == -1  " Prevent adding duplicate files
            call writefile([a:file], '.harpylist', 'a')  " Append only valid files
            echo "Harpy: File added."
        else
            echo "Harpy: File already exists in the list."
        endif
    else
        echo "Harpy: File '" . a:file . "' is not readable or does not exist."
    endif
endfunction

" Create mappings for up to 5 files
for i in range(1, 5)
    execute 'nnoremap <leader>h' . i . ' :call HarpyJump(' . i . ')<CR>'
endfor

function! HarpyCleanList()
    " Read the current .harpylist file
    let lines = readfile('.harpylist')

    " Filter out unreadable or non-existent files
    let valid_lines = filter(lines, 'filereadable(v:val)')

    " Write the cleaned list back to the .harpylist file
    call writefile(valid_lines, '.harpylist')

    echo "Harpy list cleaned."
endfunction

function! HarpyCleanList()
    " Clear the contents of the .harpylist file
    call writefile([], '.harpylist')
    echo "Harpy list cleared."
endfunction

nnoremap <leader>hc :call HarpyCleanList()<CR>

" End Harpy configuration
"

"Highlight clear SignColumn
highlight SignColumn guibg=darkgrey

"Toggle Autopair
let g:AutoPairsShortcutToggle = '<leader>ap'

"Compile and run C file
au FileType c map <leader>rc :!gcc -o %:r % && ./%:r<CR>

"Compile C file
au FileType c map <leader>cc :!gcc -o %:r %<CR>
