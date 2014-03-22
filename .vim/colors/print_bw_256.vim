" Vim color file
" Original Author:  Mike Williams <mrw@eandem.co.uk>
" Last Change:	2014-03-22
" Version:	1.2
"
" A variant of print_bw that does not depend on the lower 16 colors of your
" terminal.

" Remove all existing highlighting.
set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "print_bw_256"

highlight Normal	    cterm=NONE ctermfg=232 ctermbg=231
highlight NonText	    ctermfg=232 ctermbg=231
highlight LineNr        cterm=italic ctermfg=232 ctermbg=231

" Syntax highlighting scheme
highlight Comment	    cterm=italic ctermfg=232 ctermbg=231

highlight Constant	    ctermfg=232 ctermbg=231
highlight String	    ctermfg=232 ctermbg=231
highlight Character	    ctermfg=232 ctermbg=231
highlight Number	    ctermfg=232 ctermbg=231
" Boolean defaults to Constant
highlight Float		    ctermfg=232 ctermbg=231

highlight Identifier	ctermfg=232 ctermbg=231
highlight Function	    ctermfg=232 ctermbg=231

highlight Statement	    ctermfg=232 ctermbg=231
highlight Conditional	ctermfg=232 ctermbg=231
highlight Repeat	    ctermfg=232 ctermbg=231
highlight Label		    ctermfg=232 ctermbg=231
highlight Operator	    ctermfg=232 ctermbg=231
" Keyword defaults to Statement
" Exception defaults to Statement

highlight PreProc	    cterm=bold ctermfg=232 ctermbg=231
" Include defaults to PreProc
" Define defaults to PreProc
" Macro defaults to PreProc
" PreCondit defaults to PreProc

highlight Type		    cterm=bold ctermfg=232 ctermbg=231
" StorageClass defaults to Type
" Structure defaults to Type
" Typedef defaults to Type

highlight Special	    cterm=italic ctermfg=232 ctermbg=231
" SpecialChar defaults to Special
" Tag defaults to Special
" Delimiter defaults to Special
highlight SpecialComment cterm=italic ctermfg=232 ctermbg=231
" Debug defaults to Special

highlight Todo		    cterm=italic,bold ctermfg=232 ctermbg=231
" Ideally, the bg color would be white but VIM cannot print white on black!
highlight Error		    cterm=bold,reverse ctermfg=232 ctermbg=240

" vim:et:ff=unix:tw=0:ts=4:sw=4
" EOF print_bw.vim
