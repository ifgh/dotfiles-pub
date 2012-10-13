" Vim color file -- based on:
" Maintainer:	Juan frias <juandfrias at gmail dot com>
" Last Change:	2007 Feb 25
" Version:	1.0.1
" URL:		http://www.axisym3.net/jdany/vim-the-editor/#eclipse

set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "eclipse2"

highlight Normal ctermfg=Gray
highlight TabLine cterm=none ctermfg=black ctermbg=grey
highlight TabLineSel cterm=none ctermfg=yellow ctermbg=black

" Search
highlight Search    ctermbg=1
highlight LineNr    ctermfg=darkgrey

" Split area
highlight StatusLine   cterm=bold       ctermbg=grey     ctermfg=black
highlight StatusLineNC cterm=none       ctermfg=darkgrey ctermbg=grey
highlight VertSplit    ctermfg=grey cterm=none       ctermbg=grey

" Diff
highlight DiffText   cterm=bold    ctermbg=5  ctermfg=3
highlight DiffChange cterm=none    ctermbg=5  ctermfg=7
highlight DiffDelete ctermbg=black
highlight DiffAdd    ctermbg=green cterm=bold

" Fold
highlight Folded     ctermbg=black ctermfg=black cterm=bold
highlight FoldColumn ctermfg=black ctermbg=white

" Popup Menu
highlight PMenu      ctermbg=green ctermfg=white
highlight PMenuSel   ctermbg=white ctermfg=black
highlight PMenuSBar  ctermbg=red   ctermfg=white
highlight PMenuThumb ctermbg=white ctermfg=red

" Other
highlight SpecialKey cterm=none       ctermfg=4
highlight Visual     ctermfg=DarkCyan
highlight NonText    ctermfg=DarkRed

" Syntax group
highlight Comment    ctermfg=2
highlight Constant   ctermfg=White
highlight Error      term=reverse        ctermbg=Red    ctermfg=White
highlight Identifier ctermfg=Green
highlight Ignore     ctermfg=black
highlight PreProc    ctermfg=Green
highlight Special    ctermfg=DarkMagenta
highlight Statement  ctermfg=White
highlight Todo       term=standout       ctermbg=Yellow ctermfg=Black
highlight Type       ctermfg=LightGreen
highlight String     ctermfg=Yellow
highlight Number     ctermfg=White
