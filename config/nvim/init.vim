" config file for neovim
" created by Isaac Freund

" The biggest key on your keyboard is the best leader key of course
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" for all its greatness, fish isn't very POSIX compliant
set shell=bash

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

" open the auto-detected root of projects as the working directory
Plug 'airblade/vim-rooter'

" fast fuzzy find with skim
Plug '/usr/bin/sk'
Plug 'ifreund/skim-preview.vim'

" syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

call plug#end()

"""" editor settings """"

filetype plugin indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set updatetime=100 " governs how often things like git-gutter update

" persistent undo
set undodir=~/.config/nvim/undo
set undofile

" use ripgrep if availible
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" gui settings
set background=dark
colorscheme solarized
set relativenumber
set nowrap
set scrolloff=3
set noshowmode
set cursorline
" always draw sign column, needed so the view doesn't jump when something
" writes to it (e.g. vim-gitgutter)
set signcolumn=yes

"""" plugin settings """"

" airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_solarized_normal_green = 1
let g:airline_solarized_dark_text = 1
let g:airline_solarized_dark_inactive_background = 1
let g:airline_solarized_dark_inactive_border = 1
let g:airline_solarized_enable_command_color = 1

" skim-preview
let g:fzf_preview_directory_files_command = 'git rev-parse && rg --files --hidden --follow --no-messages -g "!.git/*"'
let g:fzf_preview_fzf_color_option = '16,current:7,cursor:4,info:-1'

"""" editor bindings """"

" homerow start/end of line
noremap H 0
noremap L $
" write with leader
nnoremap <leader>w :w<CR>
" shows/hides hidden characters
nnoremap <leader>, :set invlist<CR>
" switch to previous buffer
nnoremap <leader><leader> <C-^>

"""" plugin bindings """"

" open files
map <C-p> :FzfPreviewDirectoryFiles<CR>
nmap <leader>p <C-p>
" switch buffers
nmap <leader>; :FzfPreviewBuffers<CR>
" grep across files with preview
nnoremap <leader>s :FzfPreviewProjectGrep<CR>
