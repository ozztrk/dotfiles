#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ozan.oeztuerk/.sdkman"
[[ -s "/Users/ozan.oeztuerk/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ozan.oeztuerk/.sdkman/bin/sdkman-init.sh"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ozan.oeztuerk/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ozan.oeztuerk/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

