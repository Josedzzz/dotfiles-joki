# 1. Homebrew PATH
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# 2. Colored & highlighted tab completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' 'su=41;30' 'sg=46;30' 'tw=42;30' 'ow=43;30'

# Make Up/Down arrows search history by typed prefix, and jump to the end of the line
function history-search-backward-end {
  zle history-beginning-search-backward
  zle end-of-line
}
zle -N history-search-backward-end

function history-search-forward-end {
  zle history-beginning-search-forward
  zle end-of-line
}
zle -N history-search-forward-end

bindkey '^[[A' history-search-backward-end   # Up arrow
bindkey '^[[B' history-search-forward-end    # Down arrow

# Alias for managing dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 3. Launch Starship
eval "$(starship init zsh)"
