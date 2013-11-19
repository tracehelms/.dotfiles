# tput setaf x = set foreground color
# tput setab x = set background color
#
# tput colors
# 1 red
# 2 yellow
# 3 orange
# 4 blue
# 5 magenta
# 6 cyan
# 7 white
red_fg=$(tput setaf 1)
yellow_fg=$(tput setaf 2)
orange_fg=$(tput setaf 3)
blue_fg=$(tput setaf 4)
magenta_fg=$(tput setaf 5)
cyan_fg=$(tput setaf 6)
white_fg=$(tput setaf 7)
reset_color=$(tput sgr0)

# Function that will show the git branch and dirty status (via color) in the prompt
git_branch (){
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    # Branch clean
    git_color=$blue_fg
  else
    # Branch dirty
    git_color=$red_fg
  fi
  echo " ${git_color}[$git_branch]"
}


# The prompt
export PS1="$orange_fg\w\$(git_branch)$orange_fg\$$reset_color "

