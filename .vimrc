set nocompatible

"======================"
" Vundle configuration "
"======================"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " Required
  Plugin 'gmarik/vundle'
  " Install plugins that come from github.  Once Vundle is installed, these can be
  " installed with :PluginInstall
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'vim-scripts/netrw.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'SirVer/ultisnips'
  " Provide many default snippets for a variety of snippets.
  " Uncomment and :PluginInstall to enable
  Plugin 'honza/vim-snippets'

  Plugin 'fatih/vim-go'
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-colorscheme-primary'
  Plugin 'google/vim-glaive'
  Plugin 'google/vim-maktaba'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'ycm-core/YouCompleteMe'

  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
      \ 'https://github.com/VundleVim/Vundle.vim'
endif

call glaive#Install()

filetype plugin indent on

"===================="
" Some basic options "
"===================="

" Enable syntax highlighting
syntax on

" Uncomment if you want to map ; to : to cut down on chording
nnoremap ; :

" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" Show line numbers
"set number

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Highlight the search term when you search for it.
set hlsearch

" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nnoremap <s-k> <CR>

" Explicitly set the Leader to comma. You can use '\' (the default),
" or anything else (some people like ';').
let mapleader=','


"============================"
" Load and Configure Plugins "
"============================"

" Load the code formatting plugin.We authomattically enable formatting when we
" write the file for Go and c/cpp files.
" Use :h codefmt for more details.
Glaive codefmt plugin[mappings] gofmt_executable="goimports"

" Wrap autocmds inside an augroup to protect against reloading this script.
" For more details, see:
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat c and c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

"====================="
" Some custom options "
"====================="

let g:airline_powerline_fonts = 1
let g:airline_theme='google_dark'
set ttimeoutlen=10
set t_Co=256
set background=dark
colorscheme primary