if [[ "$OSTYPE" != darwin* ]]; then
	return
fi

# https://unix.stackexchange.com/a/219678

function paste-pb() {
	emulate -L zsh
	killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
	CUTBUFFER=$(pbpaste)
	zle yank
}

function copy-command-line-pb() {
	emulate -L zsh
	echo -n "$BUFFER" | pbcopy
}

zle -N paste-pb
bindkey "^xp" paste-pb

zle -N copy-command-line-pb
bindkey "^xc" copy-command-line-pb
