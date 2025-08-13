# Definir secuencia de escape para #0000ff
COLOR_BLUE="%{$(printf '\033[38;2;0;0;255m')%}"
COLOR_BLUE_BOLD="%{$(printf '\033[1;38;2;0;0;255m')%}"

PROMPT="%(?:${COLOR_BLUE_BOLD}%1{➜%} :${COLOR_BLUE_BOLD}%1{➜%} ) ${COLOR_BLUE}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="${COLOR_BLUE_BOLD}git:(${COLOR_BLUE}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="${COLOR_BLUE}) ${COLOR_BLUE}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="${COLOR_BLUE})"
