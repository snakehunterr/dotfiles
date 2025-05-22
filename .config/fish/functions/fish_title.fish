function fish_title
    set -l curr (status current-command)
    if test $curr = fish
        prompt_pwd
    else
        echo (string shorten --max 15 (status current-commandline))
    end
end
