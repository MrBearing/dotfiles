# dotfiles

my dotfiles for Unix shell.

This Repository contains installation script and configurations for essential tools.

## Requirements

- `make`

### Ubuntu

```bash
sudo apt install -y make
```

## Setup
Following packages will be installed.

<!-- - tmux -->
<!-- - nvim -->
- fzf
<!-- - vimplug -->
- github-cli

And some useful shell scripts will be available.

To setup, type

```bash
make
```

## Optional Packages

- docker & docker-compose
- ros2 (humble)
- vscode
- Google Chrome

To install optional packages, type

```bash
make install-optional
```

## Extra

- Groot
  - `make groot`
- Rust
  - `make rust`

## SSH server and x11vnc setup

To setup ssh server and x11vnc,

```bash
make config-ssh-server
```

And it will ask
- SSH port to open.

