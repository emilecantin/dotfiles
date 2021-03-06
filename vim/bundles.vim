set nocompatible               " be iMproved
filetype off                   " required!

if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.dotfiles/vim/bundle/vundle/
  call vundle#rc()
endif

" Init Vundle :
Plugin 'gmarik/vundle'

"Generally useful:
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'triglav/vim-visual-increment'
Plugin 'Align'

" Customization :
Plugin 'flazz/vim-colorschemes'
Plugin 'noahfrederick/vim-noctu'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
" Plugin 'techlivezheng/vim-plugin-minibufexpl'

" Autocomplete :
"Plugin 'Valloric/YouCompleteMe'
" Plugin 'ervandew/supertab'
if has('nvim')
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
else
  Plugin 'ervandew/supertab'
endif

" Search & navigation :
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
if has('nvim')
  " Plugin 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plugin 'scrooloose/nerdtree'
else
  Plugin 'scrooloose/nerdtree'
endif

" Language support :
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'ap/vim-css-color'
Plugin 'vim-scripts/genutils'
Plugin 'michalliu/jsoncodecs.vim'
Plugin 'michalliu/jsruntime.vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'digitaltoad/vim-jade'
" Plugin 'eraserhd/vim-ios'
Plugin 'rodjek/vim-puppet'
Plugin 'mattn/emmet-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'ledger/vim-ledger'
Plugin 'ruanyl/vim-sort-imports'

" SCM support :
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Snippet support :
"Plugin 'SirVer/ultisnips'
"Plugin 'garbas/vim-snipmate'

" Snippets
Plugin 'honza/vim-snippets'

filetype plugin indent on     " required!
