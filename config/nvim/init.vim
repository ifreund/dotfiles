let mapleader = "\<Space>"

call plug#begin()

" gui enhancements
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" qol enhancements
Plug 'andymass/vim-matchup'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" open in the auto-detected root of projects
Plug 'airblade/vim-rooter'

" fuzzy find
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

call plug#end()

" use ripgrep if availible
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" editor settings
filetype plugin indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set updatetime=100 " governs how often things like git-gutter update

" Permanent undo
set undodir=~/.config/nvim/undo
set undofile

" gui settings
set background=dark
colorscheme solarized
set relativenumber
set nowrap
set scrolloff=3
set noshowmode
set cursorline
set signcolumn=yes " always draw sign column.

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_solarized_normal_green = 1
let g:airline_solarized_dark_text = 1
let g:airline_solarized_dark_inactive_background = 1
let g:airline_solarized_dark_inactive_border = 1
let g:airline_solarized_enable_command_color = 1

" keybindings

" better macro movement
noremap H 0
noremap L $

" quicker write
nnoremap <leader>w :w<CR>
" shows/hides hidden characters
nnoremap <leader>, :set invlist<CR>
" format rust code
nnoremap <leader>f :RustFmt<CR>

" fzy open file
map <C-p> :Files<CR>
nmap <leader>p <C-p>
" fzy switch buffer
nmap <leader>; :Buffers<CR>
" switch to previous buffer
nnoremap <leader><leader> <C-^>

" ripgrep -> fzy project search
" taken from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
noremap <leader>s :Rg 
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
