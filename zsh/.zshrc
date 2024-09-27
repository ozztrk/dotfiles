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


# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"


# 1password
eval "$(op completion zsh)"; compdef _op op

# alias code-insiders -> code
alias code="code-insiders"



# Source work-related configurations
if [ -f "$HOME/.zshrc_work" ]; then
  source "$HOME/.zshrc_work"
fi

