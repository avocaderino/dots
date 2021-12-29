# Alias defenitions

# packages
alias yay='sudo apt update && sudo apt upgrade' # apt update and upgrade
alias yeet='sudo apt autoremove --purge'        # purge an installed package
alias evida='apt search --names-only'           # search for packages
alias pip-update='pip list -l --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'

# vims
alias :q='exit'                                 # live in
alias :wq='exit'                                # vim
alias vib='vim.basic'                           
alias vit='vim.tiny'

# misc.
alias pls='sudo $(fc -ln -1)'                   # run previous command as sudo
alias icat='kitty +kitten icat'                 # images in kitty
alias python='python3'                          # no, I'm not lazy
#alias doom='~/.emacs.d/bin/doom'                # doom emacs bullshit

