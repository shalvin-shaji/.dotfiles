# Created by newuser for 5.9
source ~/.dotfiles/zshconfigs/catppuccin_mocha-zsh-syntax-highlighting.zsh

source ~/.dotfiles/zshconfigs/syntax-high/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

path+=('/home/shalv/.local/bin')
source /home/shalv/.dotfiles/zshconfigs/completion.zsh
source /home/shalv/alias


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shalv/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shalv/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shalv/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shalv/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

