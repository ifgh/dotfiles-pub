" Vim color file
" Maintainer:  Vain
" Last Change: 2012-05-20
" Description: Based on neuromouse by nnoell which is based on cottonmouse by Milomouse.

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vairomouse"

if &t_Co > 255
  hi Normal         term=NONE cterm=NONE ctermfg=247  ctermbg=NONE
  hi Boolean        term=NONE cterm=NONE ctermfg=9    ctermbg=NONE
  hi Character      term=NONE cterm=NONE ctermfg=9    ctermbg=NONE
  hi Comment        term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
  hi Conditional    term=NONE cterm=NONE ctermfg=45   ctermbg=NONE
  hi Constant       term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
  hi Cursor         term=NONE cterm=NONE ctermfg=NONE ctermbg=4
  hi CursorLine     term=NONE cterm=NONE ctermfg=NONE ctermbg=8
  hi CursorColumn   term=NONE cterm=NONE ctermfg=NONE ctermbg=8
  hi ColorColumn    term=NONE cterm=NONE ctermfg=NONE ctermbg=232
  hi Debug          term=NONE cterm=NONE ctermfg=181  ctermbg=NONE
  hi Define         term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
  hi Delimiter      term=NONE cterm=NONE ctermfg=39   ctermbg=NONE
  hi DiffAdd        term=NONE cterm=NONE ctermfg=66   ctermbg=237
  hi DiffChange     term=NONE cterm=NONE ctermfg=NONE ctermbg=236
  hi DiffDelete     term=NONE cterm=NONE ctermfg=236  ctermbg=238
  hi DiffText       term=NONE cterm=NONE ctermfg=217  ctermbg=237
  hi Directory      term=NONE cterm=NONE ctermfg=188  ctermbg=NONE
  hi ErrorMsg       term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
  hi Error          term=NONE cterm=NONE ctermfg=13   ctermbg=234
  hi Exception      term=NONE cterm=NONE ctermfg=249  ctermbg=NONE
  hi FoldColumn     term=NONE cterm=NONE ctermfg=15   ctermbg=234
  hi Folded         term=NONE cterm=NONE ctermfg=59   ctermbg=234
  hi Function       term=NONE cterm=NONE ctermfg=132  ctermbg=NONE
  hi Identifier     term=NONE cterm=NONE ctermfg=110  ctermbg=NONE
  hi IncSearch      term=NONE cterm=NONE ctermfg=16   ctermbg=226 
  hi Keyword        term=NONE cterm=NONE ctermfg=12   ctermbg=NONE
  hi Label          term=NONE cterm=NONE ctermfg=187  ctermbg=NONE
  hi LineNr         term=NONE cterm=NONE ctermfg=239  ctermbg=233
  hi Macro          term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
  hi ModeMsg        term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
  hi MoreMsg        term=NONE cterm=NONE ctermfg=15   ctermbg=NONE
  hi NonText        term=NONE cterm=NONE ctermfg=46   ctermbg=232
  hi Number         term=NONE cterm=NONE ctermfg=141  ctermbg=NONE
  hi Operator       term=NONE cterm=NONE ctermfg=88   ctermbg=NONE
  hi PreCondit      term=NONE cterm=NONE ctermfg=180  ctermbg=NONE
  hi PreProc        term=NONE cterm=NONE ctermfg=12   ctermbg=NONE
  hi Question       term=NONE cterm=NONE ctermfg=15   ctermbg=NONE
  hi Repeat         term=NONE cterm=NONE ctermfg=131  ctermbg=NONE
  hi Search         term=NONE cterm=NONE ctermfg=16   ctermbg=166
  hi SpecialChar    term=NONE cterm=NONE ctermfg=181  ctermbg=NONE
  hi SpecialComment term=NONE cterm=NONE ctermfg=108  ctermbg=NONE
  hi Special        term=NONE cterm=NONE ctermfg=128  ctermbg=NONE
  hi SpecialKey     term=NONE cterm=NONE ctermfg=46   ctermbg=NONE
  hi Statement      term=NONE cterm=NONE ctermfg=98   ctermbg=NONE
  hi StatusLine     term=NONE cterm=NONE ctermfg=6    ctermbg=234
  hi StatusLineNC   term=NONE cterm=NONE ctermfg=234  ctermbg=59
  hi StorageClass   term=NONE cterm=NONE ctermfg=249  ctermbg=NONE
  hi String         term=NONE cterm=NONE ctermfg=231  ctermbg=235
  hi Structure      term=NONE cterm=NONE ctermfg=229  ctermbg=NONE
  hi TabLine        term=NONE cterm=NONE ctermfg=245  ctermbg=236
  hi TabLineFill    term=NONE cterm=NONE ctermfg=15   ctermbg=233
  hi TabLineSel     term=NONE cterm=NONE ctermfg=15   ctermbg=16
  hi Tag            term=NONE cterm=NONE ctermfg=10   ctermbg=NONE
  hi Title          term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
  hi Todo           term=NONE cterm=NONE ctermfg=16   ctermbg=9 
  hi Typedef        term=NONE cterm=NONE ctermfg=253  ctermbg=NONE
  hi Type           term=NONE cterm=NONE ctermfg=170  ctermbg=NONE
  hi Underlined     term=NONE cterm=NONE ctermfg=188  ctermbg=NONE
  hi VertSplit      term=NONE cterm=NONE ctermfg=236  ctermbg=59
  hi Visual         term=NONE cterm=NONE ctermfg=16   ctermbg=240
  hi VisualNOS      term=NONE cterm=NONE ctermfg=5    ctermbg=NONE
  hi WarningMsg     term=NONE cterm=NONE ctermfg=15   ctermbg=NONE
  hi WildMenu       term=NONE cterm=REVERSE ctermfg=194  ctermbg=NONE

  hi link helpHyperTextEntry Define
  hi link helpHyperTextJump Delimiter
  hi link helpBar Special
  hi link helpStar Special
endif
