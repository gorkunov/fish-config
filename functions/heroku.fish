function heroku
  if echo $argv | grep -q -E '\-\-app'
    eval "/usr/bin/heroku $argv"
  else if test -n (echo $heroku_app)
    echo "Run cli for $heroku_app"
    eval "/usr/bin/heroku $argv --app $heroku_app"
  else
    eval "/usr/bin/heroku $argv"
  end
end
