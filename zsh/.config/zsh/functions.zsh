function extract {
	if [ ! -f "$1" ]; then
		echo "'$1' is not a valid file" >&2
		return 1
	fi

	echo "Extracting $1 ..."

	case "$1" in
		*.tar.bz2|*.tbz2)
			tar xjf "./$1" ;;
		*.tar.gz|*.tgz)
			tar xzf "./$1" ;;
		*.tar.xz|*.txz)
			tar xJf "./$1" ;;
		*.7z)
			7z x "./$1" ;;
		*.bz2)
			bunzip2 --keep "./$1" ;;
		*.cab|*.exe)
			cabextract "./$1" ;;
		*.gz)
			gunzip --keep "./$1" ;;
		*.lzma)
			unlzma --keep "./$1" ;;
		*.rar)
			unrar x "./$1" ;;
		*.tar)
			tar xf "./$1" ;;
		*.xz)
			unxz --keep "./$1" ;;
		*.Z)
			uncompress -k "./$1" ;;
		*.zip)
			unzip "./$1" ;;
		*)
			echo "'$1' cannot be extracted via extract()" >&2
			return 1
			;;
	esac
}

function git_pull_all {
	local current_branch run

	current_branch=$(git symbolic-ref HEAD 2> /dev/null)
	[ "$1" = "-n" ] && shift && run="echo"

	for branch in $(git branch | cut -c 3-) ; do
		$run git checkout "$branch" && $run git pull --ff-only || return 2
	done

	[ ${#current_branch} -gt 0 ] && $run git checkout "${current_branch#refs/heads/}"
}

function man {
	env \
		LESS_TERMCAP_mb="$(printf '\e[1;31m')" \
		LESS_TERMCAP_md="$(printf '\e[1;31m')" \
		LESS_TERMCAP_me="$(printf '\e[0m')" \
		LESS_TERMCAP_se="$(printf '\e[0m')" \
		LESS_TERMCAP_so="$(printf '\e[1;44;33m')" \
		LESS_TERMCAP_ue="$(printf '\e[0m')" \
		LESS_TERMCAP_us="$(printf '\e[1;32m')" \
		man "$@"
}
