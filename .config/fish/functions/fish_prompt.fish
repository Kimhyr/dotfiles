function prompt_pwd
    set R (string replace $HOME '~' (pwd))
    echo $R
end

function fish_prompt
    set_color grey
    echo (prompt_pwd)
    set_color green
    echo "➞  "
end