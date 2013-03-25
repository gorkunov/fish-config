function fish_prompt
    set_color $fish_color_operator
    echo -n '['
    echo -n (prompt_pwd)
    echo -n ']'
    set_color $fish_color_command
    echo -n '$ '
    set_color normal
end
