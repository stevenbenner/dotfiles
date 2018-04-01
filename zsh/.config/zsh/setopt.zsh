# basics
setopt AUTO_CD # if you type foo, and it isn't a command, and it is a directory in your cdpath, go there

# history
setopt APPEND_HISTORY # allow multiple terminal sessions to all append to one zsh command history
setopt EXTENDED_HISTORY # include more information about when the command was executed, etc
setopt HIST_FIND_NO_DUPS # when searching history don't display results already cycled through twice
setopt HIST_IGNORE_DUPS # do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_ALL_DUPS # do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_SPACE # do not save history for commanding beginning with a space
setopt HIST_REDUCE_BLANKS # remove extra blanks from each command line being added to history
setopt INC_APPEND_HISTORY # add comamnds as they are typed, don't wait until shell exit

# completion
setopt ALWAYS_TO_END # when completing from the middle of a word, move the cursor to the end of the word
setopt COMPLETE_IN_WORD # allow completion from within a word/phrase
setopt LIST_PACKED # make the completion list take less lines with variable width columns

# prompt
setopt AUTO_MENU # automatically use menu completion after the second consecutive request for completion
setopt PROMPT_SUBST # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
