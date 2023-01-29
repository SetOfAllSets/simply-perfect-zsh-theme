right_triangle() {
   echo $'\ue0b0'
}

left_triangle() {
	echo $'\ue0b2'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

dir() {
	ARROW_FG="015"
	ARROW_BG="033"
	NEXT_ARROW_BG=""
	NEXT_ARROW_FG="033"
	echo "$(arrow_start) %~ $(arrow_end)"
}

name() {
	ARROW_FG="015"
        ARROW_BG="016"
        NEXT_ARROW_BG="033"
        NEXT_ARROW_FG="016"
	echo "$(arrow_start) %n $(arrow_end)"
}

check() {
	echo '%F{green}%B\u2714%b%f'
}

cross() {
	echo '%F{red}\u2717%f'
}

status() {
	echo "%(?.$(check).$(cross))"
}

ending() {
	ARROW_FG="015"
        ARROW_BG="016"
        NEXT_ARROW_BG=""
        NEXT_ARROW_FG="016"
	echo "%F{016}$(left_triangle)%f$(arrow_start)$(status)%F{015}%K{016} | %B%T%b%f%k$(arrow_end)"
}

PROMPT='$(name)$(dir)'
RPROMPT='$(ending)'
