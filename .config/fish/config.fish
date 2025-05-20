fish_add_path -aP "$GOPATH/bin"
fish_add_path -aP "$CARGO_HOME/bin"
fish_add_path -aP "$HOME/.local/bin"

if status is-login
end

if status is-interactive
end
