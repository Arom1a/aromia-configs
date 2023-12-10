#!/usr/zsh
zmodload zsh/mathfunc

fsleep()
{
    sudo pmset disablesleep 1

    if [ "$1" = "f" ];then
    echo "Sleep will be disabled forever. You can interupt with enter key. "
    read
    else
        if [ $# = 0 ];then
            time=$(( 10 * 60 ))
        else
            time=$(( $1 * 60 ))
            time=$(( int($time) ))
        fi
    date -r $(( $(date +%s) + $time )) +'Sleep will be disabled until %H:%M:%S. You can interupt wieh enter key ...'
    read -t $time
    fi

    sudo pmset disablesleep 0
}
