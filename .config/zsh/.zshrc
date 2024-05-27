###############
#             #
# Environment #
#             #
###############


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
    [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
fi

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
unalias zi

# Brew
if [ "$(uname -m)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Python
if [ "$(uname -m)" = "arm64" ]; then
    # Setting PATH for Python 3.12
    PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
    export PATH
fi

# Cargo
. "$HOME/.cargo/env"


###############
#             #
# ZSH Plugins #
#             #
###############


if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    # Powerlevel10k
    zinit ice depth=1; zinit light romkatv/powerlevel10k
    # ZSH plugins
    zinit light zsh-users/zsh-completions
    autoload -U compinit; compinit
    source $ZDOTDIR/completion.zsh

    zinit light zsh-users/zsh-autosuggestions
    zinit light zdharma-continuum/fast-syntax-highlighting
    fast-theme XDG:catppuccin-mocha &>/dev/null


    zinit cdreplay -q

    eval "$(fzf --zsh)"
fi


###############
#             #
# ZSH Options #
#             #
###############


export EDITOR=vim
export VISUAL=vi

setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
export SAVEHIST=1000000
export HISTSIZE=20000

bindkey -v
export KEYTIMEOUT=1


#######################
#                     #
# Aliases and Scripts #
#                     #
#######################


# Aliases for Arch Linux
source $ZDOTDIR/usr/alias-files/arch_aliases.zsh

# Aliases for VScode
source $ZDOTDIR/usr/alias-files/vscode_aliases.zsh

# Aliases for Obsidian
source $ZDOTDIR/usr/alias-files/obsidian_aliases.zsh

# Aliases for cli tools
source $ZDOTDIR/usr/alias-files/cli_aliases.zsh

# Aliases for misc stuff
source $ZDOTDIR/usr/alias-files/misc_aliases.zsh

# Aliases for git
source $ZDOTDIR/usr/alias-files/git_aliases.zsh

# Aliasses for tmux
source $ZDOTDIR/usr/alias-files/tmux_aliases.zsh

# Importing scripts
source $ZDOTDIR/usr/scripts/python_package.zsh
source $ZDOTDIR/usr/scripts/pdfrange.zsh
source $ZDOTDIR/usr/scripts/pdfpng.zsh
source $ZDOTDIR/usr/scripts/cfile.zsh
source $ZDOTDIR/usr/scripts/githubraw.zsh
source $ZDOTDIR/usr/scripts/fsleep.zsh
source $ZDOTDIR/usr/scripts/gettime.zsh


###############
#             #
# Environment #
#             #
###############


# Zoxide
eval "$(zoxide init zsh)"

if [ "$(uname -m)" = "arm64" ]; then
    # Added by OrbStack: command-line tools and integration
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
    # pnpm
    export PNPM_HOME="/Users/aromia/Library/pnpm"
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
fi

if [ "$(uname -m)" = "x86_64" ]; then
    # pnpm
    export PNPM_HOME="/home/arom1a/.local/share/pnpm"
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end

    # bun completions
    [ -s "/Users/aromia/.bun/_bun" ] &&
    source "/Users/aromia/.bun/_bun"
fi
