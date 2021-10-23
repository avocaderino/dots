# Alias defenitions

# apt update and upgrade
alias yay='sudo apt update && sudo apt upgrade'

# purge an installed package
alias yeet='sudo apt remove --purge'

# copy with a progress bar using rsync
alias dup='rsync -ah --info=progress2'

# move to trash
alias chodi='mv --force -t ~/.local/share/Trash/files'
