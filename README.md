# dotfiles

This is my collection of configuration files. These are only fully tested on an [Arch Linux](https://archlinux.org/) system, however I also use most of these on [Debian](https://www.debian.org/) and [FreeBSD](https://www.freebsd.org/) systems.

## Installation

### Stow

This repository is designed to have individual folders symlinked with the [GNU Stow](https://www.gnu.org/software/stow/) utility.

For this to work the dotfiles folder needs to be in the home directory (e.g. `~/dotfiles/`). You can then simply `cd` into the `dotfiles` folder and stow a specific config folder to hook it up.

Example:

`stow git`

### Manual symlinks

Some items may be better installed by manually crating symlinks for specific files. In particular, the `ssh` folder, so as to preserve the permissions and keep any keys out of the dotfiles git repo.

`ln -s ssh/.ssh/config ~/.ssh/config`
