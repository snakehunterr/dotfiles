set -Ux EDITOR helix
set -Ux VISUAL helix

set -Ux RUSTUP_HOME $HOME/.local/rustup
set -Ux CARGO_HOME $HOME/.local/cargo

set -Ux GOPATH $HOME/.local/go
set -Ux GOBIN $GOPATH/bin
set -Ux GO111MODULE on

set -Ux NPM_CONFIG_USERCONFIG $HOME/.config/npm/npmrc
set -Ux npm_config_prefix $HOME/.local

set -U __fish_git_prompt_show_informative_status 1
set -U __fish_git_prompt_showuntrackedfiles 1
set -U __fish_git_prompt_showcolorhints 1
set -U __fish_git_prompt_show_informative_status 1
set -U __fish_git_prompt_describe_style contains

set -U async_prompt_inherit_variables all

set -U fish_color_autosuggestion brblack
set -U fish_color_cancel --reverse
set -U fish_color_command green
set -U fish_color_comment normal
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end green
set -U fish_color_error brred
set -U fish_color_escape brcyan
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_host_remote yellow
set -U fish_color_keyword normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator brcyan
set -U fish_color_option cyan
set -U fish_color_param cyan
set -U fish_color_quote yellow
set -U fish_color_redirection cyan --bold
set -U fish_color_search_match bryellow '--background=brblack'
set -U fish_color_selection white --bold '--background=brblack'
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
