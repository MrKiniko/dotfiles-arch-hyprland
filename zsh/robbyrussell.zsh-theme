# Definir secuencia de escape para #0000ff
COLOR_GREEN="%{$(printf '\033[38;2;0;253;94m')%}"
COLOR_GREEN_BOLD="%{$(printf '\033[1;38;2;0;253;94m')%}"

PROMPT="%(?:${COLOR_GREEN_BOLD}%1{󰣇%} :${COLOR_GREEN_BOLD}%1{󰣇%} ) ${COLOR_GREEN}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="${COLOR_GREEN_BOLD}git:(${COLOR_GREEN}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="${COLOR_GREEN}) ${COLOR_GREEN}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="${COLOR_GREEN})"

