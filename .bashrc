# -------------
# Gemeinsames reinholen.

source ~/work/dotfiles-pub/.bash_environment
source ~/work/dotfiles-pub/.bash_aliases
source ~/work/dotfiles-pub/.bash_functions


# -------------
# Titlebar.

case $TERM in
	xterm*|rxvt*)
		export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}${HOSTEXTENSION}\007"'
		;;
	screen*)
		# Wenn du im Screen bist, dann setze nur den Screen-Titel, denn
		# das andere wird vom Screen eh ausgefiltert. Aber: In .screenrc
		# so gesetzt, dass Screen selbst ggf. 'nen Terminal-Titel setzt.
		export PROMPT_COMMAND='echo -ne "\033k${PWD/$HOME/~}${HOSTEXTENSION}\033\\"'
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
mkdir -p /tmp/{download,tmp}

# Paste initialisieren.
stouch


# -------------
# Firefox: Temporäres Profil

tmptarget=/tmp/ff-temp-profile
tmpbase=~/.mozilla/firefox/FirefoxTempBase
if [[ ! -d "$tmptarget" ]] && [[ -d "$tmpbase" ]]
then
	cp -aRL "$tmpbase" "$tmptarget"
	sed -i "s#__USER_HOME__#$HOME#" "$tmptarget/prefs.js"
	find "$tmptarget" -type f -exec \
		sed -i "s#__EMPLOYER_DOMAIN__#$(< ~/.employer_domain)#" '{}' ';'

	[[ -r ~/work/dotfiles/.firefox-local ]] && .  ~/work/dotfiles/.firefox-local
fi


# -------------
# Eventuell lokal Dinge überschreiben

[[ -r ~/work/dotfiles/.bashrc-local ]] && .  ~/work/dotfiles/.bashrc-local


# -------------
# Auf tty2 ins X starten.

if [[ $(tty) == "/dev/tty2" ]]
then
	mv -f ~/.xsession.log{,.old}
	exec 1>~/.xsession.log
	exec 2>&1
	exec 0<&-
	exec startx
fi
