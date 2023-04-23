function git_prompt_info {
	local ref=$(git symbolic-ref HEAD 2> /dev/null)
	local gitst="$(git status 2> /dev/null)"
	local gitstatus

	if [[ -f .git/MERGE_HEAD ]]; then
		if [[ ${gitst} =~ 'unmerged' ]]; then
			gitstatus="%F{red}unmerged%f"
		else
			gitstatus="%F{green}merged%f"
		fi
	elif [[ ${gitst} =~ 'Changes to be committed' ]]; then
		gitstatus="%F{blue}%B!%b%f"
	elif [[ ${gitst} =~ 'use "git add' ]]; then
		gitstatus="%F{red}%B!%b%f"
	elif [[ ${gitst} =~ 'have diverged' ]]; then
		gitstatus="%F{161}][%b%f"
	elif [[ -n $(git checkout HEAD 2> /dev/null | grep ahead) ]]; then
		gitstatus="%F{yellow}%B*%b%f"
	fi

	if [[ -n $ref ]]; then
		echo "%F{green}[%B${ref#refs/heads/}%b]%f $gitstatus"
	elif [[ ${gitst} =~ 'HEAD detached at' ]]; then
		echo "%F{red}[%Bdetached%b]%f "
	fi
}

function ssh_prompt_info {
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
		echo "%F{033}%n%F{white}@%F{cyan}%m%f "
	fi
}

export PROMPT='$(ssh_prompt_info)%~%<< $(git_prompt_info)► '
