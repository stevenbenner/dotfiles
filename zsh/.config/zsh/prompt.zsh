git_prompt_info() {
	local gitstatus

	gitstatus=$(git status --porcelain=v2 --branch 2> /dev/null)

	# if we're in a git repo
	if (( $? != 128 )); then
		local branch ab chmark abmark

		branch=$(awk '$2 == "branch.head" { print $3 }' <<< "$gitstatus")
		ab=$(awk '$2 == "branch.ab" { gsub(/[+-]/, ""); print $3,$4 }' <<< "$gitstatus")

		# pending changes mark
		if [[ -f .git/MERGE_HEAD ]]; then
			# merge in progress
			if (( $(awk '$1 == u { print $2 }' <<< "$gitstatus" | wc -l) > 0 )); then
				chmark="%F{red}unmerged%f" # have unmerged changes
			else
				chmark="%F{green}merged%f" # have merged changes
			fi
		elif (( $(awk '$1 ~ /^[12]$/ && $2 ~ /^[MTADRC]/ { print $2 }' <<< "$gitstatus" | wc -l) > 0 )); then
			chmark="%F{blue}%B⊕%b%f" # have staged changes
		elif (( $(awk '$1 ~ /^[12?]$/ { print $2 }' <<< "$gitstatus" | wc -l) > 0 )); then
			chmark="%F{red}%B⊞%b%f" # have unstaged changes
		fi

		# upstream sync mark
		case "$ab" in
			'')
				abmark="%F{magenta}%B⋪%b%f" ;; # no upstream
			'0 0')
				abmark="%F{green}%B≣%b%f" ;; # synced with upstream
			'0 '*)
				abmark="%F{blue}%B⊂%b%f" ;; # behind upstream
			*' 0')
				abmark="%F{yellow}%B⊃%b%f" ;; # ahead of upstream
			*)
				abmark="%F{red}%B⊉%b%f" ;; # diverged
		esac

		# full git status with current branch
		if [[ $branch != '(detached)' ]]; then
			echo "%F{green}[%B$branch%b]%f$abmark$chmark " # on a branch
		else
			echo "%F{red}[%Bdetached%b]%f " # detached from branch
		fi
	fi
}

ssh_prompt_info() {
	if [[ -n $SSH_CLIENT || -n $SSH_TTY ]]; then
		echo "%F{033}%n%F{white}@%F{cyan}%m%f "
	fi
}

# shellcheck disable=SC2016
export PROMPT='$(ssh_prompt_info)%~%<< $(git_prompt_info)► '
