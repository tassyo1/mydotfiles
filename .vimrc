execute pathogen#infect()
syntax on             " Enable syntax highlighting

set nocompatible      " We're running Vim, not Vi!

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set pastetoggle=<F2>

set number
set relativenumber
set autochdir

set wildmode=list:longest,full
set wildmenu

"Indentation
filetype plugin indent on
set smartindent
set cindent
set autoindent
set copyindent
set preserveindent

" code checks
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_javascript_checkers = ['eslint']

"key bindinds
map <F2> :NERDTreeToggle<CR>
map <F3> :SyntasticCheck<CR>
map <M-F3> :SyntasticReset<CR>

"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Lightline
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive',  'filename' ] ]
      \ },     
      \   'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
    if &filetype == "help"
      return ""
    elseif &modified
      return "+"
    elseif &modifiable
      return ""
    else
      return ""
    endif
  endfunction

 function! LightLineReadonly()
   if &filetype == "help"
     return ""
   elseif &readonly
     return "⭤"     
   else
     return ""
   endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
           \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
           \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  endfunction


" Track the engine.
" Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
"
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"
