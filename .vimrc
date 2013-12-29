" -------------
" Jetzt nötig mit "richtigem" Vim-Package bei Arch (2009-09-14):

syntax enable
filetype plugin indent on
set hls
set incsearch
set showcmd
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
		\ | diffthis | wincmd p | diffthis
endif


" -------------
" Zusätzliche Pakete, die nicht systemweit installiert sind.

set runtimepath+=~/work/vim/ubuntuusers-vim


" -------------
" Leader auf's Komma

let mapleader=","
let maplocalleader=","


" -------------
" Komfortfunktionen für dotfiles

nmap <Leader>dotv :tabe $MYVIMRC<CR>
nmap <Leader>dotV :source $MYVIMRC<CR>
nmap <Leader>dotb :tabe ~/.bashrc<CR>
			\:tabe ~/work/dotfiles-pub/.bash_aliases<CR>
			\:tabe ~/work/dotfiles-pub/.bash_functions<CR>
			\:tabe ~/work/dotfiles-pub/.bash_environment<CR>
nmap <Leader>dotm :tabe ~/.muttrc<CR>
nmap <Leader>dotx :tabe ~/.Xresources<CR>


" -------------
" Grundlegendes Verhalten

set virtualedit=block

" Hotkeys, die die Tabbreite ändern.
for i in range(1, 8)
	exe 'map <ESC>'.i.' :set ts='.i.' sw='.i.'<CR>'
endfor

" Schnellere Klammerpaarhervorhebung
let loaded_matchparen = 1
set showmatch

" Nicht überlange Zeilen am Rand durch @s ersetzen, sondern nur am Ende
" drei @s platzieren.
set display+=lastline

" Show unprintable characters as <xx>
set display+=uhex

" Aktualisiere weder Inhalt noch Fenster, solange noch irgendetwas
" (Makro, Funktion, ...) ausgeführt wird.
set lazyredraw

" Keine zusätzlichen Dateien wie Backups oder VIMINFO.
set nobackup
set nowritebackup
set viminfo=""

" Speichere Swapfiles an einer zentralen Stelle (beachte die zwei
" Slashes). Eliminiert global das Problem, dass immer *.swp-Dateien
" rumliegen und in VCS'en ständig ignoriert werden müssen etc. Ja, es
" liegt in einem tmpfs und ist nach einem Systemabsturz weg. Dieses
" Risiko gehe ich ein, weil es mir wichtiger ist, dass sensible Daten,
" die eventuell in einem encfs liegen, nicht durch ein Swapfile auf der
" Platte landen. Recovery nach einem Crash des Systems (!) habe ich in
" all den Jahren vielleicht ein Mal gebraucht.
" Wenn ich eine solche Recovery in Zukunft mal gebraucht *hätte*, weiß
" ich ja, welchen Commit ich reverten muss, nachdem sich der Ärger
" gelegt hat. :-)
if isdirectory('/tmp/vim-' . $USER) == 0
	:silent !mkdir /tmp/vim-$USER >/dev/null 2>&1
endif
set directory=/tmp/vim-$USER//

" Beim Schreiben der Swapfile kein fsync() absetzen. Das bewirkt einen
" kurzen Hänger und nervt tierisch.
set swapsync=

" Tabline
set showtabline=2
set tabpagemax=1000

" Schönerer Workflow: Wartet nach Escape nicht so ewig
set timeoutlen=750

" Color Column!
fun! AddAllColorColumns(begin, max)
	" Alle von begin bis einschließlich max erzeugen.
	let l:str = ''
	let l:at = a:begin
	while (l:at < a:max)
		let l:str = l:str . l:at . ","
		let l:at = l:at + 1
	endwhile
	let l:str = l:str . a:max

	" War schon was gesetzt? Dann hänge unser neues an.
	if (strlen(&colorcolumn) > 0)
		let l:str = &colorcolumn . "," . l:str
	endif

	exec 'set colorcolumn=' . l:str
endfun

" Die 73 will ich immer als Begrenzer sehen, aktuelle Textwidth auch und
" dann alles über 80 Zeichen.
set colorcolumn=73,+1
call AddAllColorColumns(81, 300)

" Vervollständigung mit schönem Menü.
set wildmenu

" Rewrapping von gq} auf Q
map Q gq}

" Toggle tw=0 / tw=72
fun! ToggleTextwidth()
	if (&tw == 0)
		setl tw=72
	else
		setl tw=0
	endif
endfun
nmap <Leader>W :call ToggleTextwidth()<CR>

" Besseres Movement in langen Zeilen: j und k bedeuten jetzt eine
" Bewegung um eine *sichtbare* Zeile.
nmap k gk
nmap j gj

" C-Direction zum Fensterwechsel.
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Suchergebnisse nicht mehr highlighten:
map <F12> :noh<CR>

" Control-Space führt zu ganz seltsamen Effekten und manchmal komme ich
" ungewollt auf diese Kombination. Mach's aus. (@, weil Control-Space
" ein Null-Byte einfügt.)
inoremap <C-@> <Space>

" Tabs und Umbrüche kontrollieren
set tw=72
set nolist
set number
set ai tabstop=4 sw=4
set linebreak
set listchars=tab:\|-,eol:$,precedes:<,extends:>,trail:#,nbsp:%
set sidescroll=1
map <F11> :set list!<CR>
map <Leader>w :set wrap!<CR>
set nowrap

" Scrolling offsets.
set scrolloff=2
set sidescrolloff=0

" Modelines immer an, auch für root.
set modeline

" Shortcut, um trailing und inner whitespace zu killen.
map <Leader>st :%s/[[:space:]]\+$//gc<CR>
map <Leader>si :%s/[^[:space:]]\zs[[:space:]]\{2,\}\ze[^[:space:]]/ /gc<CR>

" Suche non-ASCII-Zeichen
map <Leader>sa /[^\x00-\x7F]<CR>

" Spawn XTerm
map <Leader>sx :silent !xterm&<CR>

" Quotes wechseln
map <Leader>qgf :%s/\v"([^"]+)"/»\1«/gc<CR>
map <Leader>qfg :%s/\v»([^«]+)«/"\1"/gc<CR>

" Shortcuts für scons und make - nicht vergessen, dass für Screen
" eventuell das ein oder andere remapped werden muss, s.u.
map <F5> :call CompileAndRun(1)<CR>
map <F6> :call CompileAndRun(0)<CR>
map <S-F5> :call CompileAndRun(0)<CR>
map <C-F5> :w \| !./%<CR>

map <F7> :w \| !scons 2>&1 && xpdf *pdf<CR>
map <F8> :w \| !make view TEXFILE=% 2>&1<CR>

" Quickfix mit Tabs besser.
set switchbuf=usetab,newtab

" Neuer Tab mit Quickfix.
map <Leader>f :tabnew \| cope \| wincmd k \| q<CR>

" Funktion statt einzelnen Run-Skripten für die Programme. Allerdings
" kann es immernoch ein Run-Skript geben und das hat dann auch Vorrang.
" Man kann nämlich nicht alles automatisch mit dieser Funktion hier
" abbilden (mehrere Dateien, komplexe Parameter, ...).
fun! CompileAndRun(runProgram)
	" Setze das Programm, was es auszuführen gälte. Die Variable
	" l:interpreter gibt an, dass das Programm direkt ausgeführt werden
	" soll -- ist sie 1, dann wird unterbunden, dass auf Ausführbarkeit
	" des Programms getestet wird. l:domake weist einen Programmbau an.
	" In l:runner steht, wie ein eventuelles Run-Skript heißt.
	let l:progname = './' . expand('%:t:r')
	let l:interpreter = 0
	let l:domake = 1
	let l:runner = './run'

	" Der normale make-Befehl piped das irgendwie an "tee" weiter. Das
	" hat aber zur Folge, dass der Returncode vom ersten Befehl verloren
	" geht. Das hier ist ein Tipp aus dem Netz, wie man trotzdem noch an
	" den ersten Returncode herankommt:
	setl shellpipe=2>&1\ \|\ tee\ %s;exit\ \${PIPESTATUS[0]}

	" Finde heraus, mit was du das Programm bauen kannst.
	if filereadable("SConstruct")
		setl makeprg=scons
	elseif filereadable("Makefile") || filereadable("makefile")
		setl makeprg=make
	elseif filereadable("build.xml")
		setl makeprg=ant
	elseif &filetype == 'c'
		setl makeprg=${CC:-gcc}\ -std=gnu89\ -Wall\ -Wextra\ -Wpedantic\ -O2\ -o\ %<\ %
	elseif &filetype == 'cpp'
		setl makeprg=g++\ -Wall\ -Wextra\ -o\ %<\ %
	elseif &filetype == 'java'
		setl makeprg=javac\ %
		let l:progname = 'java ' . expand('%:t:r')
		let l:interpreter = 1
	elseif &filetype == 'matlab'
		let l:progname = 'octave ' . expand('%') . ' | less'
		let l:interpreter = 1
		let l:domake = 0
	else
		" Bei allem anderen nimmst du an, dass die Datei selbst
		" ausführbar ist und dass man sie nicht bauen muss. Das ist bei
		" Skripten jeglicher Art der Fall. Ist sie doch nicht
		" ausführbar, dann wird das unten abgefangen.
		let l:progname = './' . expand('%')
		let l:domake = 0
	endif

	" Speichern, bauen und ggf. ausführen.
	write
	if l:domake == 1
		silent !echo -e "\n\nBuilding..."
		make!
	else
		silent !echo -e "\n\nNot running build tool."
	endif

	if v:shell_error == 0 && a:runProgram == 1
		if executable(l:runner)
			silent !echo -e "\n\nExecuting run script..."
			exec '!' . l:runner
		elseif executable(l:progname) || l:interpreter == 1
			silent exec '!echo -e "\n\nExecuting \"'
						\. l:progname . '\""...'
			exec '!' . l:progname
		endif
	endif
endfun

" Im visuellen Modus mit ,c Spalten formatieren.
vnoremap <Leader>c :!sed 's/^/-/' \| column -t \| sed 's/^-//'<CR>
vnoremap <Leader>C :!sed 's/^/-/' \| column -t \| sed 's/^-//'<CR>gv=

" Alt-right/left to navigate forward/backward in the tags stack
map <ESC>h <C-T>
map <ESC>l <C-]>

" expand/fold
map <ESC>j zo
map <ESC>k zc
map <ESC>J zO
map <ESC>K zC
set foldcolumn=0
set foldmethod=marker
set foldlevel=500

" "fof" als Abkürzung zum Einfügen von Foldmarkers.
inorea fof <C-G>u<C-R>=&fmr<CR><Esc>F,s<CR><Up><End>

" Tabs mit ä und ö wechseln.
nmap ä gt
nmap ö gT

" Tabs verschieben
fun! TabMove(d)
	if a:d == -1
		if tabpagenr() > 1
			exe ":tabm ".(tabpagenr() - 2)
		endif
	else
		exe ":tabm ".tabpagenr()
	endif
endfun
nmap Ä :call TabMove(1)<CR>
nmap Ö :call TabMove(-1)<CR>

" Buffers mit ü und Ü browsen.
nmap ü :bn<CR>
nmap Ü :bp<CR>

" Interaktion mit dem X11-Clipboard über xclip.
fun! X11Copy()
	silent %w !xclip -selection clipboard -f | xclip
endfun

fun! X11CopySel()
	silent '<,'>w !xclip -selection clipboard -f | xclip
endfun

fun! X11PasteClipboard()
	r !xclip -selection clipboard -o
endfun

fun! X11PastePrimary()
	r !xclip -o
endfun

nmap <Leader>xc :call X11Copy()<CR>
vmap <Leader>xc :call X11CopySel()<CR>
nmap <Leader>xp :call X11PasteClipboard()<CR>
nmap <Leader>xP :call X11PastePrimary()<CR>
set pastetoggle=<F10>
set mouse=


" -------------
" Verhalten abhängig vom Terminal

" Farben abhängig von der verfügbaren Farbanzahl
hi clear
set background=dark
if (&t_Co == 256)
	colorscheme termpot
else
	hi  ColorColumn  ctermbg=4
	hi  TabLineSel   ctermbg=4
	hi  PmenuSel     ctermfg=1 ctermbg=0
endif

if (&term =~ '^screen')
	" set title for screen
	" VimTip http://vim.wikia.com/wiki/VimTip1126
	set title
	set t_ts=k
	set t_fs=\

	" Remap some keys
	map <ESC>[15;2~ <S-F5>
	map <ESC>[17;2~ <S-F6>
	map <ESC>[18;2~ <S-F7>
	map <ESC>[19;2~ <S-F8>
	map <ESC>[20;2~ <S-F9>
endif

if (&term =~ '^linux')
	map <ESC>[31~ <S-F5>
endif

if (&term =~ '^xterm' || &term =~ '^rxvt')
	set title
endif


" -------------
" Hexkram

" Edit *.bin using xxd-format
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END


" -------------
" Statusline

" Immer an.
set laststatus=2
" Zeige wichtige Infos wie Zeilenenden, Encoding oder BOM.
set statusline=%f\ %y\ \ %h%m%r
			\\ \ %#Error#%{&ff=='unix'?'':'\ '.&ff.'\ '}%*
			\\ \ %#Error#%{&fenc==''?'':&fenc=='utf-8'?'':'\ '.&fenc.'\ '}%*
			\\ \ %#Error#%{&bomb?'\ BOM\ ':''}%*
			\\ \ %#Error#%{&paste?'\ PASTE\ ':''}%*
			\%=\ [C:%4b,%4B]\ [X:%3v/%3{&tw}]\ [Y:%5l/%5L]


" -------
" Printing

" Printing from Vim is complicated due to UTF-8. The author of the PS
" driver explained it here:
" http://vim.1045645.n5.nabble.com/Printing-with-utf-8-characters-on-Windows-td1193441.html
" So, just use plain old "lp" as a workaround.

fun! Hardcopy()
	" CUPS documentation says about "-o page-*":
	" The value argument is the margin in points; each point is 1/72
	" inch or 0.35mm.
	" http://www.cups.org/documentation.php/doc-1.7/options.html
	" I want a margin of about 1.8cm.
	exe "!lp -o media=A4 -o page-left=50 -o page-right=50"
				\" -o page-top=50 -o page-bottom=50 -o prettyprint"
				\(&pdev != "" ? " -d " . &pdev : "") . " " . expand("%")
endfun
command! Hardcopy :call Hardcopy()


" -------------
" Shortcuts für verschiedene Dateitypen

command! FtypeNothing :set ft=
command! FtypeBBcode :set ft=bbcode | set wrap | set tw=0
command! FtypeUbuntuusers :set ft=ubuntuusers | set wrap | set tw=72


" -------------
" explain.py einbinden

fun! DoExplainFile(explargs, yankundo)
	" Merke dir die alte Position des Cursors. Führe dann die Ersetzung
	" durch.
	let l:prev = getpos(".")
	%s/<<<explain\n\(\_.\{-}\n\)>>>\n/
				\\=system("explain ".a:explargs, submatch(1))/g

	" Dauerhaft? Oder nur yanken?
	if a:yankundo
		call X11Copy()
		u
	endif

	" Cursor wieder an die alte Stelle zurück, Highlight des
	" Suchtreffers abschalten.
	call setpos(".", l:prev)
	noh
endfun

" explain-yank-normal oder explain-here-normal. Oder "unicode".
nmap <Leader>eyn :call DoExplainFile("", 1)<CR>
nmap <Leader>ehn :call DoExplainFile("", 0)<CR>
nmap <Leader>eyu :call DoExplainFile("-u", 1)<CR>
nmap <Leader>ehu :call DoExplainFile("-u", 0)<CR>


" -------------
" Editiere gestern, heute, morgen

command! EToday :exe ":e "    . strftime("%F") . ".txt"
command! TToday :exe ":tabe " . strftime("%F") . ".txt"
command! EYesterday :exe ":e "    . strftime("%F", localtime() - (24 * 60 * 60)) . ".txt"
command! TYesterday :exe ":tabe " . strftime("%F", localtime() - (24 * 60 * 60)) . ".txt"
command! ETomorrow :exe ":e "    . strftime("%F", localtime() + (24 * 60 * 60)) . ".txt"
command! TTomorrow :exe ":tabe " . strftime("%F", localtime() + (24 * 60 * 60)) . ".txt"
command! ENow :exe ":e "    . strftime("%F--%H-%M-%S") . ".txt"
command! TNow :exe ":tabe " . strftime("%F--%H-%M-%S") . ".txt"


" -------------
" groff plaintext rendern

nmap <Leader>ggu :w \| !~/work/troff/lib/plaintext/render "%"<CR>
nmap <Leader>gga :w \| !~/work/troff/lib/plaintext/render "%" ascii<CR>


" -------------
" `dirname` mit NERDTree o.ä. öffnen (hängt nicht vom CWD ab, sondern
" vom dirname der aktuellen File).

nmap <Leader>tb :exe "tabe " . expand("%:h")<CR>


" -------------
" Help Tags vereinfachen

nmap <Leader>l ea\|<ESC>Bi\|<ESC>lyw
nmap <Leader>L o<ESC>pBi*<ESC>ea*<ESC>o<CR>

if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif


" -------------
" Settings, die vom Dateityp abhängen

autocmd FileType python setlocal et sta ts=4 sw=4
