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

" git integration
Plug 'tpope/vim-fugitive'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" open the auto-detected root of projects as the working directory
Plug 'airblade/vim-rooter'

" fast fuzzy find with skim
Plug '/usr/bin/sk'
Plug 'lotabout/skim.vim'

" language support
Plug 'rust-lang/rust.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'ziglang/zig.vim'

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

" Floating windows with borders for skim commands
function! FloatingSkim()
    let width = min([&columns - 4, 144])
    let height = min([&lines - 4, 48])

    " -2 because of the status bar
    let row = (&lines - height - 2) / 2
    let col = (&columns - width) / 2

    let opts = { 'relative': 'editor',
               \ 'row': row,
               \ 'col': col,
               \ 'width': width,
               \ 'height': height,
               \ 'style': 'minimal' }

    " Create border window
    let top = '┏' . repeat('━', width - 2) . '┓'
    let mid = '┃' . repeat(' ', width - 2) . '┃'
    let bot = '┗' . repeat('━', width - 2) . '┛'
    let border_lines = [top] + repeat([mid], height - 2) + [bot]

    " buffer scoped to the script
    let s:border_buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:border_buf, 0, -1, v:true, border_lines)
    call nvim_open_win(s:border_buf, v:true, opts)
    set winhl=Normal:Floating
    
    " make the nested window fit inside, leaving an extra column on either
    " side for a cleaner look
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4

    let s:skim_buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(s:skim_buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')

    " clears the border window after the skim window is exited
    au BufWipeout <buffer> exe 'bw '.s:border_buf
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
