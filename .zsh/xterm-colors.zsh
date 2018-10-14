if [[ $TERM != xterm-256color ]]; then
	return
fi

function set_xterm_colors() {
	emulate -L zsh
	local -A colors
	local k
	colors=(
		'22' '#002500'
		'94' '#502000'
		'23' '#002530'
		'53' '#200040'
	)
	for k in "${(@k)colors}"; do
		printf '\33]4;%s;%s\007' $k ${colors[$k]}
	done
}

set_xterm_colors
