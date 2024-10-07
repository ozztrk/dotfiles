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


# Homebrew add to Path for bat rg and fzf
export PATH="/opt/homebrew/bin:$PATH"
source <(fzf --zsh)


<<<<<<< HEAD
# Use Oh My Posh (if not apple terminal)
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_frappe.omp.json')"
fi
# store cache files in custom path to not clutter my homefolder
export OMP_CACHE_PATH="$HOME/.cache/oh-my-posh"


# Use NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

=======
# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"
>>>>>>> 739ca59 (update)

# 1password
eval "$(op completion zsh)"; compdef _op op


# alias code-insiders -> code
alias code="code-insiders"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ozan.oeztuerk/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ozan.oeztuerk/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ozan.oeztuerk/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ozan.oeztuerk/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# # Source work-related configurations
# if [ -f "$HOME/.zshrc_work" ]; then
#   source "$HOME/.zshrc_work"
# fi

