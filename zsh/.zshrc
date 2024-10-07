# ___  ___       ______             _____      _
# |  \/  |       |  _  \           /  ___|    | |
# | .  . |_   _  | | | |_____   __ \ `--.  ___| |_ _   _ _ __
# | |\/| | | | | | | | / _ \ \ / /  `--. \/ _ \ __| | | | '_ \
# | |  | | |_| | | |/ /  __/\ V /  /\__/ /  __/ |_| |_| | |_) |
# \_|  |_/\__, | |___/ \___| \_/   \____/ \___|\__|\__,_| .__/
#          __/ |                                        | |
#         |___/                                         |_|
#
#
# By Ozan Öztürk (2024)


# Use NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

# 1password
eval "$(op completion zsh)"; compdef _op op


# alias code-insiders -> code
alias code="code-insiders"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# # Source work-related configurations
if [ -f "$HOME/.zshrc_work" ]; then
  source "$HOME/.zshrc_work"
fi

