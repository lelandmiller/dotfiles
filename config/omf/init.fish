set -x GOPATH ~/go
set PATH $HOME/.npm-packages/bin $HOME/dotfiles/bin $HOME/bin $GOPATH/bin $PATH
set -x EDITOR vim

gulp --completion=fish | source


function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end
end

function lsa
    ls -al
end

function fish_greeting
    #welcomez
    #fortune
    #date
    #cat ~/.config/fish/functions/welcome.txt
end

function ..
    cd ..
end

function ...
    ..
    ..
end

function ....
    ...
    ..
end

function .....
    ....
    ..
end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

