# 1. Homebrew PATH
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi
export PATH="$HOME/.local/bin:$PATH"

# 2. Colored & highlighted tab completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' 'su=41;30' 'sg=46;30' 'tw=42;30' 'ow=43;30'

# 3. History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY          # write every command right away + share between open tabs
setopt EXTENDED_HISTORY       # save a timestamp with each command
setopt HIST_IGNORE_ALL_DUPS   # keep only the newest copy of a repeated command
setopt HIST_IGNORE_SPACE      # a command starting with a space is not saved
setopt HIST_REDUCE_BLANKS     # trim extra spaces before saving
setopt HIST_VERIFY            # !! / !$ show the expanded command before running it

# Up/Down: search history by what you've typed so far (cursor goes to end of line)
# built-in zsh widgets, no custom functions needed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search    # Up arrow
bindkey '^[OA' up-line-or-beginning-search    # Up arrow (application mode)
bindkey '^[[B' down-line-or-beginning-search  # Down arrow
bindkey '^[OB' down-line-or-beginning-search  # Down arrow (application mode)
# Ctrl+R: search anywhere in history (built-in)
bindkey '^R' history-incremental-search-backward

# 4. Aliases
# Alias for managing dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 5. Launch Starship
eval "$(starship init zsh)"
