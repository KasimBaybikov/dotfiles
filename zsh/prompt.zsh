#!/bin/zsh

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
new_line=$'\n'
reset_color=%{$'\e[0m'%}

blue=%{$'\e[38;5;51m'%}
grey=%{$'\e[38;5;243m'%}
violet=%{$'\e[38;5;63m'%}
green=%{$'\e[38;5;41m'%}
light_green=%{$'\e[38;5;85m'%}
purple=%{$'\e[38;5;205m'%}
setopt PROMPT_SUBST
#export PROMPT='$blue┌–$violet(%n)$light_green [%~]$purple$(parse_git_branch)$new_line$blue└–> $reset_color'

function zvm_after_select_vi_mode() {
	case $ZVM_MODE in
		$ZVM_MODE_NORMAL)
		export PROMPT='$grey┌─$violet(%n)$light_green [%~]$purple$(parse_git_branch)$new_line$grey└─> $reset_color'
			;;
		$ZVM_MODE_INSERT)
		export PROMPT='$blue┌─$violet(%n)$light_green [%~]$purple$(parse_git_branch)$new_line$blue└─> $reset_color'
			;;
		$ZVM_MODE_VISUAL)
		export PROMPT='$grey┌─$violet(%n)$light_green [%~]$purple$(parse_git_branch)$new_line$grey└─> $reset_color'
			;;
		$ZVM_MODE_VISUAL_LINE)
		export PROMPT='$grey┌─$violet(%n)$light_green [%~]$purple$(parse_git_branch)$new_line$grey└─> $reset_color'
			;;
	esac
}
