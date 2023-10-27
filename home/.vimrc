set number relativenumber
set hidden
set showtabline=2
set spelllang=en_us
setlocal spelllang=en_us
set spell
set encoding=utf-8
set langmenu=en_us
set termguicolors
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set complete+=k
set completeopt=longest,menu
set shortmess+=c
set pumheight=10
colorscheme onedark
syntax enable
"Indent
filetype indent on
set ai
set si
filetype plugin indent on
syntax on
set autoindent
set shiftwidth=2
"splits
set splitbelow
set splitright
set cursorline
highlight CursorLine term=underline ctermbg=100 guibg=#2f2f2f
highlight clear  VertSplit 
highlight Comment cterm=italic
" Cursors block in normal mode & line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Control clear +c, vim To System Clipboard 
vnoremap <C-c> :!xclip -f -sel clip <CR>
" q and tab to escape
imap q<Tab> <Esc>
vmap q<Tab> <Esc>
" s and tab to write/save file
map s<Tab> :up!  <CR>
"Q to quit vim
nmap Q :q! <CR>
vmap Q :q! <CR>
noremap E g$
" ,p to only paste last yanked
nmap ,p "0p
nmap ,P "0P"
" Move between windows Tab
nmap <tab> <C-w>w
" Y to yank line
nnoremap Y y$ 
"centered cursor while scrolling
nnoremap n nzzzv
nnoremap N Nzzzv
" J to mark a line `z to go there
nnoremap J mzJ`z
" Satisfying Undo
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ' '<C-g>u
inoremap " "<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
" Move Lines Easily Control + j to Down and +k to up for normal & Visual Mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Re-size Split windows S + x arrow , use s + curly brackets to scroll through
noremap <silent> <S-Right> :vertical resize +1<CR>
noremap <silent> <S-Left> :vertical resize -1<CR>
noremap <silent> <S-Up> :resize +1<CR>
noremap <silent> <S-Down> :resize -1<CR>
" File Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 30
noremap <C-f> :Lexplore <CR> 
" Vim Plug Plugin
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/Colorizer', {'branch':'master'}
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
call plug#end()
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='behelit'
" Emmet
let g:user_emmet_mode='n'   
let g:user_emmet_leader_key=","
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"en\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
" COC
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" COC Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
" FZF File Search
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
noremap <C-s> :Files <CR>
noremap <S-b> :Buffers<CR> 
inoremap <expr> <C-s> fzf#vim#complete('cat /usr/share/dict/words')
let $FZF_DEFAULT_COMMAND = "find . -type f -not -path '*.cache*' -not -path '*.cargo*' -not -path '*.gnupg*' -not -path '*npm*' -not -path '*.icons*' -not -path '*.pki*' -not -path '*.vifm/Trash*' -not -path '*.vim*' -not -path '*Pictures*' -not -path 'Music' -not -path 'Videos'"
" Colorizer
noremap <S-c> :ColorToggle <CR>
" Floaterm
let g:floaterm_height = 0.35
let g:floaterm_wintype = 'split'
let g:floaterm_keymap_kill   = '<S-k>'
let g:floaterm_keymap_toggle = '<S-t>'
" Prevent Weird symbols
set t_RV=
