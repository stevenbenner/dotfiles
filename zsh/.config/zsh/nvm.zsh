function load_nvmrc {
	if [[ -f .nvmrc && -r .nvmrc ]]; then
		nvm use
	elif [[ $(nvm version) != 'system' ]]; then
		echo "Reverting to nvm system version"
		nvm use system
	fi
}

function hook_nvm {
	unset -f nvm node npm
	if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
		source /usr/share/nvm/init-nvm.sh
		autoload -U add-zsh-hook
		add-zsh-hook chpwd load_nvmrc
		load_nvmrc
	fi
}

function nvm {
	hook_nvm
	nvm "$@"
}

function node {
	hook_nvm
	node "$@"
}

function npm {
	hook_nvm
	npm "$@"
}
