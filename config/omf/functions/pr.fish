function touchf
    set path $argv[1]
    mkdir -p (dirname $path)
    touch $path
end
