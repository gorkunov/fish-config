function fish_title
    set -l command (echo $_)
    if test $command = "fish"
        pwd
    else
        echo $command
    end
end
