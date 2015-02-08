function heroku_active
  set -gx heroku_app $argv
  echo "Set heroku app to $heroku_app"
end
