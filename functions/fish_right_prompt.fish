set fish_git_dirty_color red
function git_dirty_status 
    set -l dirty_status (git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n (echo $dirty_status)
        echo (set_color $fish_git_dirty_color)"*"(set_color normal)
    end
end
 
set fish_git_branch_color green
function git_info
    set -l git_branch (git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///')
    if test -n $git_branch
        echo -n (git_dirty_status)
        echo -n (set_color $fish_git_branch_color)"["$git_branch"]"(set_color normal)
    end
end
 
set fish_ruby_version blue
function ruby_version
    set -l ruby_version (rbenv version 2> /dev/null | sed 's/[ \t].*$//')
    echo -n (set_color $fish_ruby_version)"["$ruby_version"]"(set_color normal)
end
 
function fish_right_prompt
    echo -n (git_info)
    echo -n (ruby_version)
end
