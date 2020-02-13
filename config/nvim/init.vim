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
Plug 'machakann/vim-sandwich'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" open the auto-detected root of projects as the working directory
Plug 'airblade/vim-rooter'

" fast fuzzy find with skim
Plug '/usr/bin/sk'
Plug 'lotabout/skim.vim'

" syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
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

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_solarized_normal_green = 1
let g:airline_solarized_dark_text = 1
let g:airline_solarized_dark_inactive_background = 1
let g:airline_solarized_dark_inactive_border = 1
let g:airline_solarized_enable_command_color = 1

" Floating windows for skim commands
" TODO: implement border
" let $SKIM_DEFAULT_OPTIONS .= ' --border --margin=0,2'
function! FloatingSkim()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
             \ 'row': (&lines - height) / 2,
             \ 'col': (&columns - width) / 2,
             \ 'width': width,
             \ 'height': height,
             \ 'style': 'minimal' }

  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
endfunction
let g:skim_layout = { 'window': 'call FloatingSkim()' }

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

" Open files and switch buffers with skim.vim
map <C-p> :Files<CR>
nmap <leader>p <C-p>
nmap <leader>; :Buffers<CR>
" search across all files in interactive mode using ripgrep
" TODO: this should be able to give me a preview somehow
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
nnoremap <leader>s :Rg<CR>
