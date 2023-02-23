#!/bin/zsh

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
new_line=$'\n'
reset_color=%{$'\e[0m'%}

blue=%{$'\e[38;5;51m'%}
violet=%{$'\e[38;5;63m'%}
green=%{$'\e[38;5;41m'%}
light_green=%{$'\e[38;5;85m'%}
purple=%{$'\e[38;5;205m'%}
setopt PROMPT_SUBST
export PROMPT='$blue┌–$violet(%n)$light_green [%~]$purple$(parse_git_branch)$new_line$blue└–> $reset_color'
