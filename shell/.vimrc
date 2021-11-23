set noswapfile
set spelllang=en_us
setlocal spelllang=en_us
set spell
set encoding=utf-8
set langmenu=en_us
colo onedark
"candymakan,eva01,falcon,fx,goodwolf,grb256, gruvbox, gryffin, happy_hacking,
"hybridreverse, jellyx, kalt , madeofcode , materialbox, minimalist  
function! AdaptColorscheme()
    highlight clear CursorLine
    highlight Normal ctermbg=none
    highlight LineNr ctermbg=none
    highlight Folded ctermbg=none
    highlight NonText ctermbg=none
    highlight SpecialKey ctermbg=none
    highlight VertSplit ctermbg=none
    highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif
set path =.,,**

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END
set number relativenumber

"nnoremap <C-f> :NERDTree<CR>
nnoremap <C-f> :NERDTreeToggle<CR>

let g:user_emmet_mode='n'    "only enable in normal mode.

let g:user_emmet_leader_key=","

let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
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

"Dictionary
inoremap <c-l> <c-x><c-k>
"Omni Complete
inoremap <C-O> <C-X><C-O>
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"set dictionary+=/home/kurama/Documents/scripts/extra/dic.txt
set clipboard=unamedplus
set dictionary+=/usr/share/dict/cracklib-small
set complete+=k
set completeopt=longest,menu
set shortmess+=c
set pumheight=10
"set completeopt+=noinsert
"set cmdheight=0
"augroup Main
"autocmd!
"autocmd InsertCharPre * call <SID>PopUpDict()
"augroup END
"let s:count=0
"function! s:PopUpDict()
"let AsciiCode=char2nr(v:char)
"if (AsciiCode <=# 122 && AsciiCode >=# 97) || (AsciiCode <=# 90 && AsciiCode >=# 65)  
"let s:count+=1
"if s:count >=# 3
"call feedkeys("\<c-l>")   
"endif
"else
"let s:count=0
"endif
"endfunction

"let g:jedi#popup_on_dot = 0

"let g:deoplete#enable_at_startup = 1"
" 
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
"Airline Configurations
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='behelit'
"Floaterm Configuration
let g:floaterm_height = 0.3
let g:floaterm_wintype = 'split'
"let g:floaterm_title = ''
" KB Floaterm
"let g:floaterm_keymap_new    = '<S-p>'
"let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_kill   = '<S-k>'
let g:floaterm_keymap_toggle = '<S-t>'
"cursor line
set cursorline
" Support Italics & Italic comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m" 
" Cursors block in normal mode & line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
highlight Comment cterm=italic
let g:one_allow_italics = 1
"Indent
filetype indent on
set ai
set si
filetype plugin indent on
set autoindent
set shiftwidth=2
"splits
set splitbelow
set splitright

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
"nnoremap <C-j> :m .-2<CR>==
"nnoremap <C-k> :m .+1<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" resize Split windows S + x arrow , use s + curly brackets to scroll through
" empty lines 
noremap <silent> <S-Right> :vertical resize +1<CR>
noremap <silent> <S-Left> :vertical resize -1<CR>
noremap <silent> <S-Up> :resize +1<CR>
noremap <silent> <S-Down> :resize -1<CR>
"FZF
"let g:fzf_preview_window = []
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
"let g:fzf_layout = { 'down' :'35%' }
noremap <C-s> :Files <CR>
noremap <S-b> :Buffers<CR>
"COC CONFIG
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
"Pretty
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"DOC

command! -nargs=0 Format :call CocAction('format')

autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> D :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

  function FindCursorPopUp()
     let radius = get(a:000, 0, 2)
     let srow = screenrow()
     let scol = screencol()
     " it's necessary to test entire rect, as some popup might be quite small
     for r in range(srow - radius, srow + radius)
       for c in range(scol - radius, scol + radius)
         let winid = popup_locate(r, c)
         if winid != 0
           return winid
         endif
       endfor
     endfor

     return 0
   endfunction

   function ScrollPopUp(down)
     let winid = FindCursorPopUp()
     if winid == 0
       return 0
     endif

     let pp = popup_getpos(winid)
     call popup_setoptions( winid,
           \ {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } )

     return 1
   endfunction
nnoremap <expr> <c-d> ScrollPopUp(1) ? '<esc>' : '<c-d>'
nnoremap <expr> <c-u> ScrollPopUp(0) ? '<esc>' : '<c-u>'

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx,*sh'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.xml,*jsx,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,txt,sh,jsx,js,tsx,xml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,xml,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" csttt change surround tag to a tag
" cs"' change \" \ to ' cs \' \" to \' \" 
" ysiwt add a new surrounding tag
"indent tab lines
"set list lcs=tab:\┆\ 
" % key to bounce between tags
" vi("x") select all inside vat select all around ("y")
" Ctrl+c, vim To System Clipboard 
vnoremap <C-c> :!xclip -f -sel clip <CR>
" q and tab to escape
imap q<Tab> <Esc>
" s amd tab to write/save file
map s<Tab> :w  <CR>
"Q to quit vim
nmap Q :q <CR>
