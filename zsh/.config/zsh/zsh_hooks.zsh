function precmd {
	# print working directory to title
	print -Pn "\\e]2;$PWD\\a"
}

function preexec {
	local a=${${1## *}[(w)1]}  # get the command
	local b=${a##*\/}          # get the command basename
	a="${b}${1#$a}"            # add back the parameters
	a=${a//\%/\%\%}            # escape print specials
	a=$(print -Pn "$a" | tr -d '\t\n\v\f\r')  # remove fancy whitespace
	a=${(V)a//\%/\%\%}         # escape non-visibles and print specials

	print -Pn "\\e]2;$a\\a"
}

if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
	source /usr/share/nvm/init-nvm.sh
	autoload -U add-zsh-hook
	load-nvmrc() {
		if [[ -f .nvmrc && -r .nvmrc ]]; then
			nvm use
		elif [[ $(nvm version) != 'system' ]]; then
			echo "Reverting to nvm system version"
			nvm use system
		fi
	}
	add-zsh-hook chpwd load-nvmrc
	load-nvmrc
fi
