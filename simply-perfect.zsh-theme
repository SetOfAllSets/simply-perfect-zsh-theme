right_triangle() {
   echo $'\ue0b0'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ARROW_FG="015"
ARROW_BG="021"
NEXT_ARROW_BG=""
NEXT_ARROW_FG="021"
dir() {
	ARROW_FG="015"
	ARROW_BG="021"
	NEXT_ARROW_BG=""
	NEXT_ARROW_FG="021"
	echo "$(arrow_start)%~$(arrow_end)"
}

name() {
	ARROW_FG="015"
        ARROW_BG="016"
        NEXT_ARROW_BG="021"
        NEXT_ARROW_FG="016"
	echo "$(arrow_start) %n $(arrow_end)"
}

check() {
	echo $'%F{green}\uf00c%f'
}

cross() {
	echo $'%F{red}\u2717%f'
}

status() {
	echo "%(?.$(check).$(cross)"
}

PROMPT='$(name)$(dir)'
RPROMPT='$(status)'
