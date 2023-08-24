alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias rm='/bin/rm -i'
alias ln='/bin/ln -i'
alias less='/usr/bin/less -M'
alias v='ls -hoB --time-style=long-iso'
alias now='/bin/date +"%Y-%m-%d %H:%M:%S %z"'
alias grep='grep --color=auto'
alias rs='/usr/bin/rsync -r --progress --stats -h'
alias sqlite3='/usr/bin/sqlite3 -header'
alias jqr="jq -r -R '. as \$line | try fromjson catch \$line'"

alias term='xterm &!'

alias mpg123='/usr/bin/mpg123 --index --gapless --smooth --control --title --verbose --output alsa'
alias mplayer-hdmi='mplayer -ao alsa:device=hdmi'
alias ffprobe='ffprobe -hide_banner'
alias ffmpeg='ffmpeg -hide_banner'
alias highlight-html='highlight --syntax html --out-format xterm256'
