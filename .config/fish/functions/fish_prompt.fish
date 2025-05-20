function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    set -l wd (basename $PWD)
    if test $wd = $USER
        set wd "~"
    end

    set -l prompt (set_color red)" "(set_color normal)
    # string join " " -- $wd $stat $prompt
    string join " " -- $wd $prompt
end
