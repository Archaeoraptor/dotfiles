# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
zmodload zsh/zprof
export GPG_TTY=$TTY

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zhixi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Key bingdings

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init zsh)"

# Powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GOPRIVATE setting for downloading private 

export GOPRIVATE=github.com/archaeoraptor

# Language Setting
export LANG=en_US.UTF-8
export LANGUAGE="en_US:UTF-8"

export GPG_TTY=$TTY
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GOPROXY=https://goproxy.io,direct
# history command no repeat
setopt HIST_IGNORE_DUPS

# 不保留重复的历史记录项
setopt hist_ignore_all_dups
# # 在命令前添加空格，不将此命令添加到记录文件中
setopt hist_ignore_space
# # zsh 4.3.6 doesn't have this option
setopt hist_fcntl_lock 2>/dev/null
setopt hist_reduce_blanks

alias ls="exa"
alias ll="exa --git --group --long --time-style=iso"
alias la="exa --all --git --group"
alias vi="nvim"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias yay="paru"

alias sshcd="ssh -i ~/.ssh/id_cd ubuntu@139.155.69.60"
alias sshtc="ssh -i ~/.ssh/uestc1 root@139.155.48.208"
alias ssh221="ssh -i ~/.ssh/id_rsa_221 xi102@211.83.111.221"

## path setting
export PATH="$PATH:/opt/cuda/include"
export PATH="$PATH:/opt/cuda/bin"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Editor setting(vim)
export EDITOR=/usr/bin/vim

PATH="/home/zhixi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/zhixi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/zhixi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/zhixi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/zhixi/perl5"; export PERL_MM_OPT
