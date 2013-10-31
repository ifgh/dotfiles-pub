#!/bin/bash

# Nur Dinge, die wirklich als Shell-Funktion realisiert sein müssen (zu
# komplex für ein Alias, verändern aber auch die aktuelle Umgebung).
# Alles, was prinzipiell auch ein eigenes Skript sein kann, muss auch
# eines sein, damit ich möglichst viel Funktionalität in
# wiederverwendbaren und kombinierbaren Skripten habe.

mt()
{
	mkdir -p -- "$@" && cd -- "$@"
}

bgthis()
{
	renice -n 10 $BASHPID

	ionice -c 3 -p $BASHPID
	echo -n 'ionice: '
	ionice -p $BASHPID
}

bwenter()
{
	. ~/git/blockwart/virtualenv/bin/activate
}
