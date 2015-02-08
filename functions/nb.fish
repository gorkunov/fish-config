function nb
  eval "git checkout -b $argv"
  eval "git push -u origin $argv"
end
