#                  ___
#   ___======____=---=)
# /T            \_--===)
# [ \ (0)   \~    \_-==)
#  \      / )J~~    \-=)
#   \\___/  )JJ~~~   \)
#    \_____/JJJ~~~~    \
#    / \  , \J~~~~~     \
#   (-\)\=|\\\~~~~       L__
#   (\\)  (\\\)_           \==__
#    \V    \\\) ===_____   \\\\\\
#           \V)     \_) \\\\JJ\J\)
#                       /J\JT\JJJJ)
#                       (JJJ| \UUU)
#                        (UU)


# envs init
if command -s rbenv > /dev/null
    rbenv init - | source
end

if command -s pyenv > /dev/null
    pyenv init - | source
    set -x PYENV_ROOT $HOME/.pyenv
end

if command -s goenv > /dev/null
    goenv init - | source
end

if command -s nodenv > /dev/null
    nodenv init - | source
end

# Set GOPAHT, GOROOT
if command -s go > /dev/null
    set -x GOPATH $HOME/ghq
    set -x PATH $GOPATH/bin $PATH
end

# Add npm global bin to $PATH
if command -s npm > /dev/null
    set -x PATH $PATH (npm bin -g)
end

if command -s cargo > /dev/null
    set -x PATH $PATH "/Users/tamrin/.cargo/bin"
end

if command -s rustup > /dev/null
    rustup completions fish > ~/.config/fish/completions/rustup.fish
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
if command -s hub > /dev/null
    eval (hub alias -s)
end
if command -s colordiff > /dev/null
    alias diff 'colordiff'
end
if command -s direnv > /dev/null
    eval (direnv hook fish)
end

# wrap brew in brew-file
function brew
    if test -e /usr/local/etc/brew-wrap > /dev/null
        brew-file brew $argv
    end
end

# Start tmux
function start_tmux
    if command -s tmux > /dev/null
        if test -z "$TMUX"; and test -z $TERMINAL_CONTEXT
            tmux -2 attach; or tmux -2 new-session
        end
    end
end

start_tmux

