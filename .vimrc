filetype off
filetype plugin indent on

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set term=xterm-256color
set encoding=UTF-8
set mouse=a
set fillchars+=vert:\▏
set laststatus=2
set noshowmode
set number
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

let mapleader = ' '
let NERDTreeRespectWildIgnore = 1

syntax on


function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=0 ctermfg=8 guibg=#00FF00 guifg=#000000
endfunction


call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'ayu-theme/ayu-vim'
Plug 'bagrat/vim-buffet'

call plug#end()

let g:startify_custom_header = startify#center([
					\'            .  &.    .##&@@@@.        ',
					\'            *(@#&@(%(#@@@@@@@@@@@@*   ',
					\'          #@@#@@@@(#@@&@@@@@@@@@&@@ . ',
					\'            &@#@@@@@@@&@@@@@@%#/(@@@@ ',
					\'           &@@@@%@@@./@@@@((@((*(((@. ',
					\'           ..&@@%%@@%@(&%&((@&@%&(( @.',
					\'              @@@&@@@@.*//((@(@((%,.#*',
					\'             #@@@@@@@& ./((((((((#    ',
					\'              ...(&##((( ((((&#%      ',
					\'      @@@*  @  ,/(%(%(((#@&((&        ',
					\'   %&@@@@@@#***///#(#(((              ',
					\'  .#(#&@&@@@@@@%((/##(@               ',
					\'  *#%%&@&@@#%%@@@@@#&#@@              ',
					\' @@@%###@&@@&&@@@@@@@@(%@@            ',
					\' .@###&&&&@@@@@@@@@@@@@(#((@          ',
					\'  ,###@@@@@&&@@@@@@@@@@@((@@@.        ',
					\' ..#%#&@@@@@@@@@@@@@@@@@((((#@        ',
					\'..,&%#%@@@@@@@@@@@@@@@@@%###%@@       '
					\ ])


nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)



set bg:dark
"let g:gruvbox_contrast_dark = 'medium'
"let g:gruvbox_is_dark = 1
"let g:gruvbox_transparent_bg = 1
"autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors
let ayucolor="dark"
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE


let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ }

augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
	\ 'stdin': 1
	"\ 'args': ['--style="{BasedOnStyle: chromium, IndentWidth: 4}"']
\}


