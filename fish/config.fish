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
alias gco="git checkout"
alias gp="git pull"
alias gpso="git push origin"
alias gcm="git commit -m"
alias gbr="git branch"
alias gst="git status"
alias ghist="git log --pretty=format:'%C(yellow)%ad %C(reset)%C(green)[%h]%C(reset) | %s %C(blue)%an%C(reset) %C(bold)%C(red)%d%C(reset)' --graph --date=short"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdns="git diff --ignore-space-change"
alias cddream="cd ~/code/rvoh/dream/"
alias cdpsy="cd ~/code/rvoh/psychic/"
alias cdcent="cd ~/code/rvoh/wellos-central/"


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

# Homebrew keg-only installs
set -x PATH "/opt/homebrew/opt/postgresql@13/bin:$PATH"
set -x PATH "/opt/homebrew/opt/redis@6.2/bin:$PATH"

# eslint_d use flat eslint config file (https://github.com/mantoni/eslint_d.js/issues/287#issuecomment-2127224930)
set -x ESLINT_USE_FLAT_CONFIG true


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



#####################
#  Starship Prompt  #
#####################

starship init fish | source

# set SPACEFISH_PROMPT_DEFAULT_PREFIX 'with '
# set SPACEFISH_PACKAGE_SHOW false
