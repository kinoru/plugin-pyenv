if not [ -d ~/.pyenv ]
    echo "Installing pyenv..."
    git clone --depth=1 https://github.com/yyuu/pyenv ~/.pyenv
    git clone --depth=1 https://github.com/yyuu/pyenv-virtualenv ~/.pyenv/plugins/pyenv-virtualenv
end
setenv PATH $HOME"/.pyenv/bin" $PATH
setenv PATH $HOME'/.pyenv/shims' $PATH
setenv PYENV_SHELL fish
. $HOME'/.pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null

setenv PATH $HOME'/.pyenv/plugins/pyenv-virtualenv/shims' $PATH;
setenv PYENV_VIRTUALENV_INIT 1;
function _pyenv_virtualenv_hook --on-event fish_prompt;
  set -l ret $status
  if [ -n "$VIRTUAL_ENV" ]
    pyenv activate --quiet; or pyenv deactivate --quiet; or true
  else
    pyenv activate --quiet; or true
  end
  return $ret
end
