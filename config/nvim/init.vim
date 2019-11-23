let mapleader = "\<Space>"

call plug#begin()

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" open in the auto-detected root of projects
Plug 'airblade/vim-rooter'

" fuzzy find
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

call plug#end()


" use ripgrep if availible
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" editor settings
filetype plugin indent on
set autoindent
set tabstop=4
set expandtab
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8

" Permanent undo
set undodir=~/.config/nvim/undo
set undofile

" gui settings
set relativenumber
set number " absolute number instead of 0
set nowrap
set scrolloff=3
"set signcolumn=yes " Always draw sign column. Prevent buffer moving when adding/deleting sign.

" keybindings
nnoremap <Leader>w :w<CR>
