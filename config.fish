set fish_path $HOME/.config/fish
set fish_greeting
 
. $fish_path/boxen/env.fish

. $fish_path/aliases.fish
 
set LC_CTYPE "utf-8"
 
set RBENV_ROOT $BOXEN_HOME/rbenv
set PATH $BOXEN_HOME/rbenv/bin $BOXEN_HOME/rbenv/plugins/ruby-build/bin $PATH

rbenv rehash >/dev/null ^&1
 
#from https://coderwall.com/p/6hja1w
function rbenv_shell
  set -l vers $argv[1]
 
  switch "$vers"
    case '--complete'
      echo '--unset'
      echo 'system'
      exec rbenv-versions --bare
      return
    case '--unset'
      set -e RBENV_VERSION
      return 1
    case ''
      if [ -z "$RBENV_VERSION" ]
        echo "rbenv: no shell-specific version configured" >&2
        return 1
      else
        echo "$RBENV_VERSION"
        return
      end
    case '*'
      rbenv prefix "$vers" > /dev/null
      set -g -x RBENV_VERSION "$vers"
  end
end
 
function rbenv
  set -l command $argv[1]
  [ (count $argv) -gt 1 ]; and set -l args $argv[2..-1]
 
  switch $command
    case shell
      rbenv_shell $args
    case '*'
      command rbenv $command $args
  end
end
