" Vim color file
" Name:       inkpot2.vim
" Based on inkpot by:
" Maintainer: Ciaran McCreesh <ciaranm@gentoo.org>

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "inkpot2"

hi Normal          ctermfg=229 ctermbg=233
hi IncSearch       cterm=bold ctermfg=232 ctermbg=215
hi Search          ctermfg=232 ctermbg=215
hi ErrorMsg        cterm=bold ctermfg=231 ctermbg=196
hi WarningMsg      cterm=bold ctermfg=231 ctermbg=202
hi ModeMsg         cterm=bold ctermfg=63
hi MoreMsg         cterm=bold ctermfg=63
hi Question        cterm=bold ctermfg=214
hi StatusLine      cterm=bold ctermfg=244 ctermbg=235
hi StatusLineNC    ctermfg=235 ctermbg=244
hi VertSplit       ctermfg=244 ctermbg=238
hi WildMenu        cterm=bold ctermfg=214 ctermbg=232

hi DiffText        ctermfg=229 ctermbg=34
hi DiffChange      ctermfg=229 ctermbg=27
hi DiffDelete      ctermfg=229 ctermbg=124
hi DiffAdd         ctermfg=229 ctermbg=34

hi Cursor          ctermfg=237 ctermbg=63
hi lCursor         ctermfg=237 ctermbg=63
hi CursorIM        ctermfg=237 ctermbg=63

hi Folded          cterm=bold ctermfg=130 ctermbg=233
hi FoldColumn      ctermfg=61 ctermbg=232

hi Directory       ctermfg=47
hi LineNr          cterm=bold ctermfg=237 ctermbg=233
hi NonText         ctermfg=243 ctermbg=0
hi SpecialKey      ctermfg=243 ctermbg=233
hi Title           cterm=bold ctermfg=130 ctermbg=232
hi Visual          ctermfg=232 ctermbg=215

hi TabLine         cterm=none ctermfg=237 ctermbg=233
hi TabLineSel      cterm=bold ctermfg=7 ctermbg=235
hi TabLineFill     ctermfg=245 ctermbg=229

hi Comment         ctermfg=130
hi Constant        ctermfg=215
hi String          ctermfg=215 ctermbg=237
hi Error           ctermfg=231 ctermbg=196
hi Identifier      cterm=none ctermfg=207
hi Ignore          ctermfg=61
hi Number          ctermfg=105
hi PreProc         ctermfg=10
hi Special         ctermfg=63
hi Statement       ctermfg=37
hi Todo            cterm=bold ctermfg=237 ctermbg=63
hi Type            ctermfg=207
hi Underlined      cterm=bold ctermfg=229
hi TaglistTagName  cterm=bold ctermfg=37
