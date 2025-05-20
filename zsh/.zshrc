# Terminal history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# yazi support
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# eza setup
alias ls="eza --color=always --icons=always"

# zoxide
alias cd="z"
eval "$(zoxide init zsh)"

# setup fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
