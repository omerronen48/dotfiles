# dotfiles

Personal macOS dev environment — Homebrew packages, Oh My Zsh + Powerlevel10k,
custom zsh plugins, and a handful of config files. One script bootstraps a new
machine from zero.

## Layout

```
dotfiles/
├── install              # bootstrap script
└── files/
    ├── alacritty.toml   → ~/.config/alacritty/alacritty.toml
    ├── claude.md        → ~/.claude/CLAUDE.md
    ├── init.lua         → ~/.config/nvim/init.lua
    ├── p10k.zsh         → ~/.p10k.zsh
    ├── tmux.conf        → ~/.tmux.conf
    └── zshrc            → ~/.zshrc
```

## What gets installed

- **Homebrew** 
- **Formulae:** ant, awscli, ccm, docker, eza, fzf, gh, git, jq, neovim,
  openjdk@21, reattach-to-user-namespace, ripgrep, rtk, tmux, tox,
  grpc-cli, xlog
- **Casks:** alacritty, codex, font-meslo-lg-nerd-font, memoryanalyzer, warp
- **fzf** shell key bindings + completion
- **Oh My Zsh** with custom plugins: zsh-autosuggestions, zsh-syntax-highlighting,
  fast-syntax-highlighting, zsh-autocomplete, zsh-history-substring-search,
  zsh-autopair, zsh-you-should-use
- **Powerlevel10k** theme
- **TPM** (tmux plugin manager) + all plugins declared in `tmux.conf`
- **nvm**
- All dotfiles above, **symlinked** into place

## Usage

```sh
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./install
```

Then restart your shell (or `source ~/.zshrc`).

The script is idempotent — re-run any time to update Homebrew packages, pull
the latest Oh My Zsh plugins, and re-sync dotfile symlinks.

## Post-install steps

The installer handles everything automatically. A few things you may want to
do manually on a fresh machine:

1. **Restart your shell** (or `source ~/.zshrc`) so the new zshrc, plugins,
   and Powerlevel10k prompt load.
2. **Set the default shell to zsh** if needed: `chsh -s /bin/zsh`. On modern
   macOS it already is.
3. **Set Alacritty's font** to `MesloLGS Nerd Font` in `alacritty.toml` if
   it isn't already — required for Powerlevel10k icons to render. The font
   itself is installed via the `font-meslo-lg-nerd-font` cask.
4. **Open Neovim once** (`nvim`) so it can bootstrap its plugin manager
   (lazy.nvim/packer/etc.) and install plugins declared in `init.lua`.
5. **Pick a Node version via nvm** if you need one: `nvm install --lts`.

## How dotfile deployment works

Files are **symlinked**, not copied. This is the industry-standard approach
(same as `stow` and `chezmoi`): edits in either the repo or `~/.zshrc` are
reflected in the other since they point to the same inode. Commit changes
from the repo side to version them.

For each entry the installer:
1. Creates the parent directory if missing.
2. Leaves it alone if the correct symlink already exists.
3. Replaces a different symlink.
4. Backs up any real file to `<path>.backup.<timestamp>` before linking.

## Adding a new dotfile

1. Drop the file in `files/` (no leading dot — easier to browse).
2. Add a `link_dotfile` line to `install` pointing at its target path.
3. Commit.
