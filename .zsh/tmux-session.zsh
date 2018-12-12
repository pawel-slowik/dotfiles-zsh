function tmux_session() {
	emulate -L zsh
	local session_name session_file commands
	local MATCH MBEGIN MEND # parameters created by the =~ operator
	session_name="$1"
	if [[ ! "$session_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
		echo "invalid session name: $session_name" 1>&2
		return 1
	fi
	if tmux has-session -t "=$session_name" 2>/dev/null; then
		commands=(attach-session -d -t "=$session_name")
	else
		session_file="$HOME/.config/tmux-sessions/$session_name"
		if [[ ! -e "$session_file" ]]; then
			echo "no such session: $session_name" 1>&2
			return 1
		fi
		commands=(source-file "$session_file")
	fi
	tmux "${commands[@]}"
}
