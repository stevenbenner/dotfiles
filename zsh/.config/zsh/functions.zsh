# extract an archive and/or compressed file to the current working directory
extract() {
	if [[ -z $1 ]]; then
		echo "No file name specified" >&2
		return 1
	fi
	if [[ ! -f $1 ]]; then
		echo "'$1' is not a valid file" >&2
		return 1
	fi

	echo "Extracting $1 ..."

	case "$1" in
		*.tar.bz2|*.tbz2)
			tar -xjf "./$1" ;;
		*.tar.gz|*.tgz)
			tar -xzf "./$1" ;;
		*.tar.xz|*.txz)
			tar -xJf "./$1" ;;
		*.tar.zst)
			tar --zstd -xf "./$1" ;;
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
			tar -xf "./$1" ;;
		*.xz)
			unxz --keep "./$1" ;;
		*.Z)
			uncompress -k "./$1" ;;
		*.zip)
			unzip "./$1" ;;
		*.zst)
			unzstd "./$1" ;;
		*)
			echo "$1 is not a supported file format" >&2
			return 2
			;;
	esac
}

# run `git pull` on all local branches
git_pull_all() {
	local run current_branch
	local -i exit_code=0

	[[ ${1} = -n ]] && shift && run='echo'

	current_branch=$(git branch --show-current) || return "${?}"
	for branch in $(git for-each-ref --format='%(refname:lstrip=2)' refs/heads/); do
		if ! ${run} git checkout "${branch}"; then
			exit_code=2
			continue
		fi
		${run} git pull --ff-only || exit_code=3
	done
	[[ -n ${current_branch} ]] && $run git checkout "${current_branch}"

	return "${exit_code}"
}

# wrapper for man program to add some formatting
man() {
	env \
		LESS_TERMCAP_mb="$(printf '\e[1;31m')" \
		LESS_TERMCAP_md="$(printf '\e[1;31m')" \
		LESS_TERMCAP_me="$(printf '\e[0m')" \
		LESS_TERMCAP_se="$(printf '\e[0m')" \
		LESS_TERMCAP_so="$(printf '\e[1;44;33m')" \
		LESS_TERMCAP_ue="$(printf '\e[0m')" \
		LESS_TERMCAP_us="$(printf '\e[1;32m')" \
		LESS="$LESS --header=2" \
		man "$@"
}
