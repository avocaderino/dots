# Defined in - @ line 1
function yeet --wraps='sudo apt remove --purge' --description 'alias yeet sudo apt remove --purge'
  sudo apt remove --purge $argv;
end
