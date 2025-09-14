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
