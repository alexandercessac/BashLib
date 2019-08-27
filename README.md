# BashLib
Some bash scripts for this and that

## $ ./notes

Manage notes in ~/notes folder. Attempts to use the following to determine desired editor:

'{EDITOR:-${VISUAL:-$SELECTED_EDITOR}}'

If unable to deterine the desired editor, '~/.selectedEditor' is sourced in attempt to set '$SELECTED_EDITOR'


  
