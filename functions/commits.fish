function commits
    set -l project (git config --get remote.origin.url | sed "s/.*:\(.*\).git/\1/")
    if test -n $project
        set -l git_branch (git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///')
        set -l url "https:$project/commits/$git_branch"
        open $url
    end
end
