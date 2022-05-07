set nocompatible
filetype off
se encoding=utf-8

"
"
" PLUGINS
"
"

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Add plugins after this line

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'modille/groovy.vim'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'hashivim/vim-terraform'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Add plugins before this line
" Initialize plugin system
call plug#end()

"
"
" /PLUGINS
"
"

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Always show statusline
set laststatus=2

"
" Appearance
"
syntax enable
set background=dark
colorscheme gruvbox
highlight LineNr guibg=NONE
set showtabline=2 " Always show tab bar
set cursorline
" Airline
let g:airline#extensions#tabline#left_alt_sep = 'default'
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\ue0b8"
let g:airline_left_alt_sep = "\ue0b9"
let g:airline_right_sep = "\ue0be"
let g:airline_right_alt_sep = "\ue0bf"

"
" Enable true color
"
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"
" /Force theme
"

" Line numbers
set number relativenumber

autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) .
            \ ' | xclip -selection clipboard')
set laststatus=2
set noswapfile

" Cursor margin from edge of screen
set scrolloff=8

" Make exiting insert mode faster
set timeoutlen=1000 ttimeoutlen=0

" Recognize Jenkinsfiles as groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

" Use F7 to format entire buffer
map <F7> gg=G<C-o><C-o>

" Colorcolumn
:set colorcolumn=80

" Custom mappings
nnoremap <silent> <Esc> :nohl<CR>
inoremap <C-e> <C-o>A
inoremap <C-a> <C-o>I
nnoremap <C-Space> ?
nnoremap <SPACE> /
:let mapleader = ","

" Tabs
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" YAML Indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Smart Case
:set ignorecase
:set smartcase

" More natural split opening
set splitbelow
set splitright

"
" Remaps
"
" Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
" /Remaps
"

"
" Fuzzy finding
"
" Quick file opening
map <C-p> :GFiles<CR>
" Recent files
nmap <leader>fh :History<CR>
" Find from buffer filenames
nmap <leader>fb :Buffers<CR>
" Find from currently open buffer lines
nmap <leader>fo :BLines<CR>
" Find from lines of all buffers
nmap <leader>fl :Lines<CR>

"
" COC
"
set updatetime=300

" Show doc
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

map <silent> K :call <SID>show_documentation()<CR>

" GoTos
nnoremap <silent><leader>gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent><leader>gl :call CocAction('jumpDeclaration')<CR>
nnoremap <silent><leader>gi :call CocAction('jumpImplementation')<CR>
nmap <silent> gy <Plug>(coc-type-definition)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" always show signcolumns
set signcolumn=yes

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" List diagnostics
nmap <leader>ld :<C-u>CocList diagnostics<cr>

"
" /COC
"

"
" vim-go
"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
"
" vim-go
"

"
" ALE
"
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
"
" /ALE
"

"
" Terraform
"
let g:terraform_align=1
let g:terraform_fmt_on_save=1
"
" /Terraform
"
