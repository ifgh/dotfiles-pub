# -------------
# Gemeinsames reinholen.

source ~/work/dotfiles-pub/.bash_environment
source ~/work/dotfiles-pub/.bash_aliases
source ~/work/dotfiles-pub/.bash_functions


# -------------
# Titlebar.

case $TERM in
	xterm*|rxvt*)
		export PROMPT_COMMAND='echo -ne "\033]0;${PWD}${HOSTEXTENSION}\007"'
		;;
	screen*)
		# Wenn du im Screen bist, dann setze nur den Screen-Titel, denn
		# das andere wird vom Screen eh ausgefiltert. Aber: In .screenrc
		# so gesetzt, dass Screen selbst ggf. 'nen Terminal-Titel setzt.
		export PROMPT_COMMAND='echo -ne "\033k${PWD}${HOSTEXTENSION}\033\\"'
		;;
esac

# Hostextension ist erstmal leer. Die wird nur für SSH ggf. gesetzt.
export HOSTEXTENSION=""

if [[ ! -z $SSH_CONNECTION ]]
then
	# Wenn das hier eine SSH-Verbindung ist, dann schreibe in Terminal-
	# und Screen-Titel deinen Hostnamen dazu. Damit kann dezent darauf
	# hingewiesen werden, wo man ist.
	export HOSTEXTENSION="@${HOSTNAME}"
fi


# -------------
# Bash-Optionen:

export HISTFILESIZE=50000
export HISTSIZE=50000
export HISTCONTROL=ignoredups  # Keine adjunkten Duplikate in History.
shopt -s globstar              # "**" als rekursive Wildcard.
shopt -s checkjobs             # Jobs beim Logout hinschreiben.
shopt -s checkwinsize
shopt -s histreedit            # Neuer Versuch bei falschen "!"-Geschichten.


# -------------
# "Autostart":

# Recording device erstmal auf's Samson setzen.
record_samson

# Diese Verzeichnisse will ich eh immer haben:
mkdir -p /tmp/tmp/luakit
mkdir -p /tmp/tmp/youtube

# Paste initialisieren.
stouch

# Auf tty2 ins X starten, aber mit exec. Das lässt dann keine benutzbare
# Shell offen, auf die man mit Strg+Alt+F2 wechseln könnte. Wichtig
# jetzt bei systemd ist, dass das Teil auf vt2 läuft, damit die Session
# authentifiziert bleibt. (Naja, gut, bei meinem Setup ist das nicht so
# wahnsinnig wichtig, aber ich will es gleich richtig machen.) Dadurch
# wird eigentlich auch das Argument mit exec überflüssig, weil man
# sowieso nicht mehr auf vt2 wechseln kann -- da läuft ja schon X.
xtty=2
if [[ $(tty) == "/dev/tty$xtty" ]]
then
	mv -f ~/.xsession.log{,.old}
	exec 1>~/.xsession.log
	exec 2>&1
	exec 0<&-
	exec startx -- -nolisten tcp vt0$xtty
fi