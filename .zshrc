# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/plugins/completion.zsh

setopt INC_APPEND_HISTORY

export SAVEHIST=1000000
export HISTSIZE=2000

source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /Users/aromia/.config/zsh/usr/fsleep.zsh
alias tsleep="sudo pmset disablesleep 0"

export DEV="/Users/aromia/Creation/Programming"
alias dev="cd /Users/aromia/Creation/Programming;ls"

source $ZDOTDIR/usr/vscodeAlias.zsh

alias obsLearn="open 'obsidian://open?vault=LearningMaterial'"
alias obsNote="open 'obsidian://open?vault=Aromia_Notebook'"

alias ls="exa"
alias ea="exa -a"
alias el="exa -l"
alias ela="exa -la"

source $ZDOTDIR/usr/pythonPackage.zsh
source $ZDOTDIR/usr/pdfrange.zsh
# source $ZDOTDIR/usr/pdfpng.zsh
alias pdfpng="pdftocairo -png -r 300"
alias zshconfig="vim ${ZDOTDIR}/.zshrc"
alias touchid="open /etc/pam.d/; echo -n 'auth       sufficient     pam_tid.so' | pbcopy; vim /etc/pam.d/sudo"
alias p10kconfig="vim ~/.config/zsh/.p10k.zsh"
alias powerusage="top -stats pid,command,power -o power"
alias keybr="dev; cd GitHubRepo/keybr.com; open http://localhost:3000; npm start"
alias huaweiyun="echo -n WKZ!T@yBVdG8yba | pbcopy; ssh root@114.115.138.231"

alias clash="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
makefile () {mkdir -p "$(dirname "$1")" && touch "$1"; }

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
