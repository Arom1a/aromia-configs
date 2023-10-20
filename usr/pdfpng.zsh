#!/bin/zsh

pdfpng()
{
if [ $# = 1 ];then
    pdftocairo -png -r 300 $1
elif [ $# = 2 ];then
    pdftocairo -f $1 -l $1 -png -r 300 $2
elif [ $# = 3 ];then
    pdftocairo -f $1 -l $2 -png -r 300 $3
else
    echo "Error: Incorrect syntax"
fi
}
