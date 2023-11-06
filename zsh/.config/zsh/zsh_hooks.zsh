function precmd {
	# print working directory to title
	print -Pn "\\e]2;$PWD\\a"
}

function preexec {
	local trimarg cmd basecmd

	trimarg="${1#"${1%%[![:space:]]*}"}"  # trim leading whitespace
	cmd=${trimarg[(w)1]}                  # get the command
	basecmd=${cmd##*\/}                   # get the command basename
	cmd="${basecmd}${trimarg#"$cmd"}"     # add back the parameters
	cmd=$(print -Pn "$cmd" | tr -d '\t\n\v\f\r')  # remove fancy whitespace
	cmd=${(V)cmd//\%/\%\%}                # escape non-visibles and print specials

	print -Pn "\\e]2;$cmd\\a"
}
