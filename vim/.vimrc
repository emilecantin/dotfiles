" This file is here, because it is easier to bundle all my
" VIM config all in the same folder.
" Please symlink or copy it to ~/.vimrc

" Vundle and bundles configuration:
"
" IMPORTANT: On first installation, most of this file will be broken. You need
" to install bundles by running the following command inside the vim directory:
"
" vim -u bundles.vim +BundleInstall +q
"
if (has('win32') || has('win64'))
	source $HOME/vimfiles/bundles.vim
else
	source $HOME/.dotfiles/vim/bundles.vim
endif

" ================================================================================
" VIM settings
" ================================================================================

" Basic setup
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf8
" Add mouse support
set mouse=a

" Add smart indentation
set smartindent

" Indentation settings
set tabstop=2
set shiftwidth=2
set expandtab

" Set vim to update autmatically when a file's read-only state is changed
set autoread

" Set VIM to show non-printable characters
set listchars=tab:\| ,trail:•,extends:»,precedes:«,nbsp:_
set list

" Line numbers
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

let g:startify_bookmarks = [ '$MYVIMRC', '/Users/ecantin/Dropbox/todo/todo.txt' ]

" Always show statusline
set laststatus=2

" Color Scheme
colorscheme solarized
set background=dark

" GUI-specific things (MacVim and gVIM)
if has("gui_running")
	" Remove toolbar and menubar
	set guioptions-=T
  " Fix mouse in gVim
  set nomousehide
	" Set font
	set guifont=Source\ Code\ Pro\ Medium:h10
	" Platform-specific:
	if (has('win32') || has('win64'))
		" Maximize window
		au GUIEnter * simalt ~n
	endif
endif

" ================================================================================
" Plugins settings
" ================================================================================

" Configure Vim-Airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#enabled = 0

" Do not change CTRL-P's working dir
let g:ctrlp_working_path_mode = 0

"let g:nodejs_complete_config = {
"\  'js_compl_fn': 'jscomplete#CompleteJS',
"\  'max_node_compl_len': 15
"\}

let g:EclimCompletionMethod = 'omnifunc'

let g:used_javascript_libs = 'underscore,backbone,angularjs,angularui,jquery'

" Automatically sync NERDTree
"autocmd BufWinEnter * NERDTreeMirror

" No line numbers in NERDTree
let NERDTreeShowLineNumbers=0

" ================================================================================
" Key mappings
" ================================================================================

" <leader>
let mapleader = ","

" Remap some keys to make window navigation less painful
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

" Make Y behave like other capitals
nnoremap Y y$

" Remap some common typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang

" Remap cut/copy/paste to the system clipboard to the standard Ctrl-[X,C,V]
" instead of this "+y / "+gp bullshit

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
noremap <C-V> "+gP
noremap <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
inoremap <S-Insert> <C-V>
vnoremap <S-Insert> <C-V>


" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Buffer navigation
nnoremap <leader>w :bd<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>j :tabnext<CR>
nnoremap <leader>k :tabprevious<CR>


noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>

map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Search with Ctrl-F
noremap <C-f> :Ack --ignore-dir server/node_modules --ignore-dir node_modules -i 

" ================================================================================
" Auto-commands on start
" ================================================================================
autocmd VimEnter *
            \ if !argc() |
            \   Startify |
            \   NERDTree |
            \   execute "normal \<c-w>w" |
            \ endif

" ================================================================================
" Fixes...
" ================================================================================

" CtrlP or NERDTree open a split in Startify!
autocmd FileType startify setlocal buftype=

" ================================================================================
" Look for local vim config files
" ================================================================================

if filereadable(".vim.custom")
	so .vim.custom
endif

" ================================================================================
" coc.nvim setup
" ================================================================================
if has('nvim')
  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

endif
