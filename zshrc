#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto and load prompt.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    # custom prompt
    autoload -Uz promptinit
    promptinit
    prompt skwp
fi

# Get local ip for misc tasks
localip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

# Pacman aliases
alias pacupg='sudo pacman -Syu'     # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw'        # Download specified package(s) as .tar.xz ball
alias pacin='sudo pacman -S'        # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'       # Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'        # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'     # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'       # Display information about a given package in the repositories
alias pacreps='pacman -Ss'      # Search for package(s) in the repositories
alias pacloc='pacman -Qi'       # Display information about a given package in the local database
alias paclocs='pacman -Qs'      # Search for package(s) in the local database
alias paclo="pacman -Qdt"       # List all packages which are orphaned
alias pacc="sudo pacman -Scc"       # Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"        # List all files installed by a given package
alias pacown="pacman -Qo"       # Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"   # Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"   # Mark one or more installed packages as non explicitly installed

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# Force tmux to launch with 256 color support
alias tmux='tmux -2'

alias python='/usr/bin/python2'

# brutal doom easy aliases
alias brutalgz='gzdoom -file /usr/games/gzdoom/brutalv20b.pk3 "$@"'
alias brutalz='zandronum -file /usr/games/gzdoom/brutalv20b.pk3 "$@"'
alias brutalserver='zandronum-server -file /usr/games/gzdoom/brutalv20b.pk3 -host 10 -skill 4 -private +sv_forcepassword true +sv_password callmemurphy +sv_hostname NuclearGrave +TeamDamage 0.00'
alias brutalconnect='brutalz -connect $localip:10666 +CL_Password "callmemurphy"'

# bam tools
alias bamtools='/home/tobias/projects/Eric/bamtools/bin/bamtools'

# Key beindings
# Enable vi mode
bindkey -v
# Usefeul emacs key bindings retained with vi mode
bindkey '^k' kill-line
bindkey '^w' backward-kill-word
bindkey '^f' forward-word
bindkey '^o' backward-word
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Kills delay when entering vi mode
export KEYTIMEOUT=1

# Setting the go path
export GOPATH=~/golang/packages
export PATH=$PATH:~/golang/packages/bin:/sources/shellTube:/sources/shellTube/lib

# Setting GTK3 var for tux guitar
export SWT_GTK3=0 

# Set vim to be default editor
export EDITOR=vim

# Change default LS_COLORS colors for ls and tab completion
# https://github.com/trapd00r/LS_COLORS
eval $(dircolors -b $HOME/.dircolors)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
