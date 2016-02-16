function pacool
    set ids (pactl list sinks short | grep RUNNING | cut -f1 -)
    set length (echo $ids | wc -l)
    echo ids $ids
    echo length $length
    if [ $ids ]
        echo found ids
    else
        echo setting default
        set ids '1\n'
    end
    for id in $ids
        echo $id
    end
end

