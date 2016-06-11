function precmd {
	# vcs_info
	# Put the string "hostname::/full/directory/path" in the title bar:
	echo -ne "\e]2;$PWD\a"

	# Put the parentdir/currentdir in the tab
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
}

function set_running_app {
	printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

function preexec {
	local a=${${1## *}[(w)1]}  # get the command
	local b=${a##*\/}          # get the command basename
	a="${b}${1#$a}"            # add back the parameters
	a=${a//\%/\%\%}            # escape print specials
	a=$(print -Pn "$a" | tr -d "\t\n\v\f\r")  # remove fancy whitespace
	a=${(V)a//\%/\%\%}         # escape non-visibles and print specials

	print -Pn "\e]2;$a\a"
}

function postexec {
	set_running_app
}
