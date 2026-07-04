# Dotfiles: Joki

This repository contains my personal configuration files (dotfiles) for macOS. It uses a bare Git repository with `--work-tree=$HOME` to manage version control directly from the home directory.

## Overview

This setup includes configurations for the following tools:

- Zsh: Minimal `.zshrc` with Homebrew PATH, Tab autocomplete, and colored directory highlighting.
- Starship: Cross-shell prompt with a Nord color palette, Git branch/status, full directory path, and left-side padding.
- Ghostty: Terminal emulator configuration with Cascadia Code font, proper window padding, and Nerd Font icon support.

## Installation

To restore these dotfiles on a new machine, follow the steps below.

### Prerequisites

- Git
- Homebrew (for installing Starship and Ghostty)
- A Nerd Font (Cascadia Code is used in this setup)

### Steps

1. Install the required tools:

```bash
brew install starship
brew install --cask ghostty
brew install --cask font-cascadia-code
```

2. Clone the bare repository into `~/.dotfiles`:

```bash
git clone --bare https://github.com/Josedzzz/dotfiles-joki.git $HOME/.dotfiles
```

3. Define the alias and check out the files:

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

4. If Git warns about overwriting existing files (e.g., default `.zshrc`), back them up and retry:

```bash
mkdir -p ~/.dotfiles-backup
dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles-backup/{} 2>/dev/null
dotfiles checkout
```

5. Reload your shell:

```bash
exec zsh
```

6. (Optional) Configure Git to ignore untracked files in the home directory:

```bash
dotfiles config status.showUntrackedFiles no
```
