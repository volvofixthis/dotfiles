# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify histignoredups globdots cdablevars
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# End of lines added by compinstall
fpath=(~/dotfiles/zsh.completions $fpath)
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dotfiles/zsh.completions/dive.zsh

# infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
# tic $TERM.ti

function zvm_after_init() {
  bindkey -M viins -r "^H"
  bindkey -M viins -r "^J"
  bindkey -M viins -r "^K"
  bindkey -M viins -r "^L"
  bindkey -M viins "^[[1~"   beginning-of-line
  bindkey -M viins "^[[4~"   end-of-line
}

function zvm_after_lazy_keybindings() {
}

# ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
# ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
# ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# setting up env
# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
        for rc in ~/.zshrc.d/*.enabled; do
                if [ -f "$rc" ]; then
                        source "$rc"
                fi
        done
fi
unset rc

# disable XON/XOFF flow control
stty -ixon 

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-syntax-highlighting
zinit load z-shell/H-S-MW
zinit light zsh-users/zsh-autosuggestions
zinit light marlonrichert/zsh-autocomplete
