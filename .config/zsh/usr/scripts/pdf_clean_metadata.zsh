#!/bin/zsh

pdf_clean_metadata()
{
    mv "$1" "$1_original.pdf" && exiftool -all= "$1_original.pdf" && qpdf --linearize "$1_original.pdf" - > "$1"
}
