if not [ -d ~/.pyenv ]
    echo "Installing pyenv..."
    git clone --depth=1 https://github.com/yyuu/pyenv ~/.pyenv
    git clone --depth=1 https://github.com/yyuu/pyenv-virtualenv ~/.pyenv/plugins/pyenv-virtualenv
end
set -x PATH $HOME"/.pyenv/bin" $PATH
. (pyenv init -|psub)
. (pyenv virtualenv-init -|psub)
