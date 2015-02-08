function deploy_paprika
  if test -n (echo $argv)
    set heroku_app (echo $argv)
  end

  if test -n (echo $heroku_app)
    set -l git_branch (git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///')
    echo "Deploy $git_branch to $heroku_app"
    bash -c "git push $heroku_app `git subtree split --prefix server $git_branch`:master --force"
  else
    echo 'Need app_name'
  end
end
