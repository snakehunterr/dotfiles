function fish_title
    set -l curr (status current-command)
    if test $curr != fish
        echo \$ $curr
    else
        echo (basename $PWD)
    end
end
