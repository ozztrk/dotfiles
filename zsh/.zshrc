### --- Antidote Plugin Manager --- ###
# Antidote loads and manages Zsh plugins
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
# Initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
# antidote load
source ~/.zsh_plugins.zsh


### --- Completions --- ###
autoload -U compinit && compinit


### --- Shell Integrations --- ###
eval "$(fzf --zsh)"                               # fzf fuzzy finder
eval "$(zoxide init --cmd cd zsh)"                # smarter cd
# eval "$(oh-my-posh init zsh)"                   # plain oh-my-posh init
eval "$(oh-my-posh init zsh --config ~/dotfiles/zsh/catppuccin_mocha.omp.json)"


### --- History Settings --- ###
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# History behavior tweaks
setopt appendhistory              # append, don't overwrite
setopt sharehistory               # share history across sessions
setopt hist_ignore_space           # ignore cmds starting w/ space
setopt hist_save_no_dups           # don't save duplicate cmds
setopt hist_ignore_all_dups        # remove old dups
setopt hist_ignore_dups            # skip dupes when adding new
setopt hist_find_no_dups           # don't show dups in search
HISTDUP=erase                      # erase dups in history file


### --- Completion Styling --- ###
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'         # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # colorize completions
zstyle ':completion:*' menu no                              # disable menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle 'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color=always $realpath'


### --- Aliases --- ###
# General
alias code="code-insiders"
alias venv_act="source .venv/bin/activate"
alias cat="bat"
alias ls="ls --color"

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbm="git branch -m"
alias gbs="git branch --show-current"
alias gl="git log"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gdc="git diff --cached"
alias gdcw="git diff --cached --word-diff"
alias gcl="git clone"
alias gcf="git config"

# Other tools
alias lg="lazygit"
alias lzd="lazydocker"
alias fastfetch="kitten icat --align=left ~/.config/fastfetch/pochita.png | fastfetch --raw - --logo-width 40"


### --- Keybindings --- ###
# Vim mode: comment/uncomment as needed
# bindkey -e  # Emacs mode (default)
# bindkey -v  # Vim mode
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward


### --- NVM (Node Version Manager) --- ###
# Correct + non-duplicate NVM setup
export NVM_DIR="$HOME/.nvm"
# Load NVM if installed via Homebrew
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
# Load NVM bash completion if available
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


### --- PATH overrides --- ###
# Windsurf (Codeium)
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Local libraries (WORK)
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"


