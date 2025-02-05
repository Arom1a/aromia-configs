alias ls=eza
alias ea="eza -a" # all
alias el="eza -l" # long
alias ela="eza -la" # long and all
alias ead="eza -aD" # dir only
alias et1="eza -a --tree --level=1"
alias et2="eza -a --tree --level=2"
alias et3="eza -a --tree --level=3"
alias et4="eza -a --tree --level=4"
alias et5="eza -a --tree --level=5"

alias rg="rg -S" # Smart case: search case insensitively if is all lowercase. Otherwise, search case sensitively.

alias del="trash -F" # Use Finder to move the file to the trash and can be put back.

alias npm="echo 'use fking pnpm plz!'"

alias nv=nvim
alias nvd=neovide

alias color_test="msgcat --color=test | head -n 11"

alias venv="source ./venv/bin/activate"

alias bstm="nvim ~/Creation/.brainstorm.md"

alias purge_DS="fd -d=3 -ug .DS_Store -x rm"
