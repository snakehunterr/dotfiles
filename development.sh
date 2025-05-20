#! /bin/sh

# Go #

sudo pacman -S --needed --noconfirm go
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv
# go build -gcflags="all=-N -l" -o hello # used for building http server and to debug it

# FRONTEND #

sudo pacman -S --needed --noconfirm nodejs npm typescript
sudo pacman -S --needed --noconfirm prettier
sudo pacman -S --needed --noconfirm typescript-language-server
sudo pacman -S --needed --noconfirm vscode-html-languageserver
sudo pacman -S --needed --noconfirm vscode-json-languageserver
sudo pacman -S --needed --noconfirm yaml-language-server
npm install -g sass
npm install -g some-sass-language-server
npm install -g emmet-language-server
yay -S --noconfirm superhtml

# GIT #

sudo pacman -S --needed --noconfirm github-cli
npm install -g gitmoji-cli
yay -S ttf-twemoji

# SQL #

npm install -g sql-language-server
npm install -g sql-formatter

# Lua #

sudo pacman -S --needed --noconfirm lua-language-server stylua #lua

# TOML #

sudo pacman -S --needed --noconfirm taplo #toml

# RUST #

sudo pacman -S --needed --noconfirm rustup rust-analyzer
rustup install stable

# CLANG #

sudo pacman -S --needed --noconfirm clang lldb

# SHELL #

npm install -g fish-lsp
fish-lsp complete >~/.config/fish/completions/fish-lsp.fish
pacman -S --needed --noconfirm bash-language-server shfmt

# DOCKER #

sudo pacman -S --needed --noconfirm docker docker-compose
sudo systemctl enable --now docker.service
sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker
npm install -g dockerfile-language-server-nodejs

# MARKDOWN #

cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide
