function extract {
	if [ -f $1 ] ; then
		echo Extracting $1 ...
		case $1 in
			*.7z)       7z x $1       ;;
			*.bz2)      bunzip2 $1    ;;
			*.cab)      cabextract $1 ;;
			*.exe)      cabextract $1 ;;
			*.gz)       gunzip $1     ;;
			*.lzma)     unlzma $1     ;;
			*.rar)      unrar x $1    ;;
			*.tar)      tar xf $1     ;;
			*.tar.bz2)  tar xjf $1    ;;
			*.tar.gz)   tar xzf $1    ;;
			*.tar.xz)   tar xJf $1    ;;
			*.tbz2)     tar xjf $1    ;;
			*.tgz)      tar xzf $1    ;;
			*.xz)       unxz $1       ;;
			*.Z)        uncompress $1 ;;
			*.zip)      unzip $1      ;;
			*)          echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function git_pull_all() {
	local current_branch run

	current_branch=$(=git symbolic-ref HEAD 2> /dev/null)
	[ "$1" = "-n" ] && shift && run=echo

	for branch in $( git branch | cut -c3- ) ; do
		$run git checkout $branch && $run git pull --ff-only || return 2
	done

	[ ${#current_branch} -gt 0 ] && $run git checkout "${current_branch#refs/heads/}"
}

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}
