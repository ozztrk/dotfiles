### Antidote Plugin Manager ###
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Load zsh-completions
autoload -U compinit && compinit


# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config ~/dotfiles/zsh/catppuccin_mocha.omp.json)"


# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# # Nvim Config Switcher
alias nvim-lazy="NVIM_APPNAME=lazyvim nvim"
# alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=nvchad nvim"
alias nvim-astro="NVIM_APPNAME=astrovim nvim"

function nvims() {
  items=("default" "lazyvim" "nvchad" "astrovim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
bindkey -s ^a "nvims\n"


### Make History persistent between sessions
HISTSIZE=5000
HiSTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
# erase duplicates in history file
HISTDUP=erase
# append history to the history file instead of overwriting it
setopt appendhistory
# share history between sessions
setopt sharehistory
# prevent commands from being saved to history if they start with a space
setopt hist_ignore_space
# These are used to prevent any duplicate commands from being saved to the history file
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
# prevent duplicates from being shown iside historical command search
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colorize completions
zstyle ':completion:*' menu no # disable default zsh completion menu
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # fzf preview for cd completion
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle 'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color=always $realpath'

# Aliases
alias code="code-insiders"
alias venv_act="source .venv/bin/activate"
alias lg="lazygit"
alias fastfetch="kitten icat --align=left ~/.config/fastfetch/pochita.png | fastfetch --raw - --logo-width "40""
alias cat="bat"
alias ls="ls --color"
# git aliases
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

# Enable Vim Mode (-e for emacs mode)
# bindkey -e
# history search navigation (filnd related commands to f.e. docker ctrl+p)
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# export ANTHROPIC_API_KEY=


# Load Angular CLI autocompletion.
source <(ng completion script)
alias lzd='lazydocker'
