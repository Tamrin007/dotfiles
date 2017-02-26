# Load anyenv & envs
if test -d $HOME/.anyenv/
    set -x PATH $PATH $HOME/.anyenv/bin
    anyenv init - | source
end

# Set GOPAHT, GOROOT
if command -s go > /dev/null
    set -x GOPATH $HOME/ghq
    set -x PATH "$GOPATH/bin" $PATH
    set -x GOROOT $HOME/.anyenv/envs/goenv/versions/1.8.0
end

# Add npm global bin to $PATH
if command -s npm > /dev/null
    set -x PATH $PATH (npm bin -g)
end

# Aliases
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -p'
if command -s bundle > /dev/null
    alias be 'bundle exec'
end
if command -s trash > /dev/null
    alias rm 'trash'
end
if command -s nvim > /dev/null
    alias vim 'nvim'
end

# Start tmux
function start_tmux
    if command -s tmux > /dev/null
        if test -z "$TMUX" ; and test -z $TERMINAL_CONTEXT
            tmux -2 attach; or tmux -2 new-session
        end
    end
end

start_tmux

