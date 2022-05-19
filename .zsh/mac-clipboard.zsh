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

zle -N paste-pb
bindkey "^xp" paste-pb
