#!/usr/bin/env zsh

#
# color hashing function for random host name colors
#
# version: 0.1
# author: (technically) Joel Shapiro, but it's not an original method
#

color_hash() {
	setopt localoptions noshwordsplit
	local str=$1
	local integer val=0
	for i in {1..${#str}}; do
		local char=$str[$i]
		(( val += $(( #char )) ))
	done

	(( val %= $(( ${PURE_PROMPT_HOST_COLOR_MAX:-14} + 1 - ${PURE_PROMPT_HOST_COLOR_MIN:-9} )) ))
	echo $(( val + ${PURE_PROMPT_HOST_COLOR_MIN:-9} ))
}

color_hash "$@"
