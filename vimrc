execute pathogen#infect('bundle/{}')
call pathogen#helptags()
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set background=dark
let g:autopep8_diff_type='vertical'
set splitbelow
set splitright
set encoding=utf-8
let g:vimwiki_use_mouse=1
let vimwiki_automatic_nested_syntaxes=1
let g:vimwiki_folding='list'
let vwiki_1={}
let vwiki_1.path='~/Dropbox/Info/vimwiki'
let vwiki_1.path_html=vwiki_1.path . '/html'
let vwiki_1.template_path=vwiki_1.path_html . '/templates'
let g:vimwiki_list=[vwiki_1]

let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
colorscheme badwolf

let g:airline_theme='dark'
let g:airline_left_sep="\uE0B4"
let g:airline_right_sep="\uE0B6"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'

" Jim Harris' super-awesome bash script commenter
let @c=':s/^/#\ /g'
let @u=':s/^\(\d\{-\}\)#\ /\1/g'
map ,k :tabr<cr>
map ,j :tabl<cr>
map ,h :tabp<cr>
map ,l :tabn<cr>

autocmd FileType html setlocal shiftwidth=2 tabstop=2

scriptencoding utf-8

set hlsearch
set showmode
set number
set showmatch
set showcmd
set ruler
set laststatus=2
set noshowmode

" These settings are for VimWiki:
set nocompatible
syntax on

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC "Source .vimrc on save.
endif

" Keybindings for VimWiki
nmap <F8> :TagbarToggle<CR>
map ^[OR :r! date +"= \%Y-%m-\%d \%H:\%M:\%S ="<CR><CR>
map ^[OQ :VimwikiToggleListItem<CR>
map ^[OS :VimwikiDiaryIndex<CR>
map ^[[15~ :VimwikiMakeDiaryNote<CR>
let g:vimwiki_hl_headers=1
let g:vimwiki_ht_cb_checked=1

function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline,"")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

