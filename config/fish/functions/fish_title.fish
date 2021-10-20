function fish_title
    # emacs is basically the only term that can't handle it.
    if not set -q INSIDE_EMACS
        echo (status current-command) (fish_prompt_pwd_dir_length=0 prompt_pwd)
    end
end
