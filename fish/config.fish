# Vim
set -x EDITOR 'nvim'


#############
#  Aliases  #
#############

alias vi="nvim"
alias vim="nvim"
alias np="vim ~/Dropbox/notes/index.md"
alias nw="vim ~/Dropbox/notes/work.md"
alias nj="vim ~/Dropbox/writing/journal/`date +%Y-%m-%d`.md"


#####################
#  Paths and Tools  #
#####################

# Heroku toolbelt
set -x PATH "/usr/local/heroku/bin:$PATH"
set -x PATH "/Users/$USER/bin:$PATH"

# Add path that should have been there by default
set -x PATH "/usr/local/bin:$PATH"
# Add custom scripts
set -x PATH "~/.dotfiles/bin:$PATH"

# Rust
set -x PATH "$HOME/.cargo/bin:$PATH"

# Android
# set -x ANDROID_HOME ~/Library/Android/sdk
# set -x PATH ${PATH}:${ANDROID_HOME}/tools
# set -x PATH ${PATH}:${ANDROID_HOME}/platform-tools

# Yarn
set -x PATH "$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Serverless
set -x PATH "$HOME/.serverless/bin:$PATH"

# asdf
source $HOME/.asdf/asdf.fish

# Godot
export PATH="/Applications/Godot.app/Contents/MacOS:$PATH"


############################
#  Variables and Settings  #
############################

# This enables colors in the base terminal, such as folder vs. file highlighting
# set -x CLICOLOR 1
# set -x HISTCONTROL erasedups # erase duplicates in history
# set -x HISTSIZE 10000 # store 10k history entries
# # shopt -s histappend # append to the history when exiting instead of overwriting
# set -x PROMPT_COMMAND "history -a; history -c; history -r; $PROMPT_COMMAND"

# Use ripgrep by default with fzf (vim fuzzy file searcher)
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

# GetThru
set -x PRIVATE_KEY_PATH ~/.ssh/id_rsa


#####################
#  Starship Prompt  #
#####################

starship init fish | source

# set SPACEFISH_PROMPT_DEFAULT_PREFIX 'with '
# set SPACEFISH_PACKAGE_SHOW false
