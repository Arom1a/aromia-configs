#!/bin/zsh

pdfrange()
{
    if [ $# != 3 ];then
        echo "Error, you should enter 3 parameters. "
        return 1
    else
        first=$(($1))
        last=$(($2))
        fileName=$3
    fi

    pdfseparate -f $first -l $last $fileName "$fileName-%d.pdf"

    pdfunite $fileName-{$first..$last}.pdf $fileName\_$first-$last.pdf

    rm $fileName-{$first..$last}.pdf
}