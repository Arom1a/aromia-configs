#!/bin/zsh

githubraw()
{
    if [ $# = 1 ];then
        oriUrl=$1
        directory=$(pwd)
    elif [ $# = 2 ];then
        oriUrl=$1
        directory=$2
    else
        echo "Wrong numbers of inputs! "
    fi
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

    rawUrl=${oriUrl/github.com/raw.githubusercontent.com}
    rawUrl=${rawUrl/blob\//''}
    curl $rawUrl > $directory

    export https_proxy='' http_proxy='' all_proxy=''
}
