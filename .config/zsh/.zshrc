autoload -U compinit; compinit

source ~/.config/aliasrc

# Completion stuff
zstyle ':completion:*' menu select	# Completion menu
setopt COMPLETE_ALIASES
_comp_options+=(globdots)			# With hidden files

#unsetopt nomatch

# History and filepath related stuff
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS	# No duplicates in the history file
setopt autocd				# Automatic cd with just the folder's name
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Other usefull options
setopt interactive_comments
stty stop undef					# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')	# No highlighting after paste
unsetopt BEEP					# beeping is annoying

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Working with urls without quotes ("")
autoload -Uz bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# Colors
autoload -Uz colors && colors

# Editing commands in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "t413/zsh-background-notify"
zsh_add_plugin "MichaelAquilina/zsh-you-should-use"

# Keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[P' delete-char
bindkey '^H' backward-kill-word
bindkey "^p" up-line-or-beginning-search 
bindkey "^n" down-line-or-beginning-search
bindkey "^k" up-line-or-beginning-search
bindkey "^j" down-line-or-beginning-search

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Zsh related aliases
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
