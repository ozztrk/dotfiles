### Antidote Plugin Manager ###
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load


# Starship Prompt
eval "$(starship init zsh)"


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


# Aliases
alias code="code-insiders"
alias venv_act="source .venv/bin/activate"
alias lg="lazygit"
# alias fastfetch="fastfetch --kitty .config/fastfetch/pochita.png --logo-width "40""
alias fastfetch="kitten icat --align=left ~/.config/fastfetch/pochita.png | fastfetch --raw - --logo-width "40""
