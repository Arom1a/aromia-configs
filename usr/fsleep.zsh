#!/usr/zsh

fsleep()
{
    sudo pmset disablesleep 1

    if [ $# = 0 ];then
        time=$((10 * 60))
    else
        time=$(($1 * 60))
        time=$(echo $time | awk -F . '{print $1}')
    fi

    date -r $(($(date +%s) + $time)) +'Sleep will be disabled until %H:%M:%S. You can interupt by pressing enter ...'

    read -t $time

    sudo pmset disablesleep 0
}
