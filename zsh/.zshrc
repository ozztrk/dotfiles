# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Antidote Plugin Manager ###
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Load zsh-completions
autoload -U compinit && compinit


# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Nvim Config Switcher
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

# Aliases
alias code="code-insiders"
alias venv_act="source .venv/bin/activate"
alias lg="lazygit"
alias fastfetch="kitten icat --align=left ~/.config/fastfetch/pochita.png | fastfetch --raw - --logo-width "40""
alias cat="bat"
alias ls="ls --color"

# Enable Vim Mode (-e for emacs mode)
# bindkey -e
# history search navigation (filnd related commands to f.e. docker ctrl+p)
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
