source $HOME/.bash_aliases;

BLUE='\[\e[38;2;0;225;255m\]'
YELLOW='\[\e[38;2;240;255;0m\]'
GREEN='\[\e[38;2;57;255;20m\]'
RESET='\[\e[0m\]'

PS1="${BLUE}\u@sandbox${RESET}:${YELLOW}\w${RESET}\n${GREEN}> ${RESET}"
