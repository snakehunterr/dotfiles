function ssh_agent
    if test -z (pgrep ssh-agent)
        eval (ssh-agent -c) >/dev/null
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        string join " " ssh-agent (set_color green)activated (set_color normal)
        ssh-add ~/.ssh/github
    end
end
