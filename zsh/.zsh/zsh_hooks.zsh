function precmd {
	# print working directory to title
	echo -ne "\e]2;$PWD\a"
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
