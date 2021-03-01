# Get the aliases and functions
# if [ -f ~/.bashrc ]; then
source ~/.bashrc
# fi

# Custom functions
cdl() { cd "$@" && ls -a; } # cd and display new directory info
mkcd() { mkdir "$@" && cd "$@"; }

tolsdir() {
  if [ $2 ]
  then
    local subdir="/lesson${2}"
  fi
  cdl ~/learn_to_code/launch_school/${1}${subdir}
}

study() {
  if [ tmux ls ]
  then
    tmux a -t study
  else
    tmux new -s study -n "Launch School IDE"
  fi
}

hist() {
  if [ $1 ] 
  then
    history | grep -P "(?<!hist )${1}"
  else
    history
  fi
}

new_project() {
  jsfile="${1}.js"
  cssfile="${1}.css"
  mkdir $1
  cd $1
  echo -e "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js\">\n</script>
<script src=\"./javascripts/${jsfile}\"></script>\n<link rel=\"stylesheet\" href=\"./stylesheets/${cssfile}\" />" > index.html
  
  mkdir stylesheets
  touch "stylesheets/${1}.css"
  mkdir javascripts
  touch "javascripts/${1}.js"
}

new_react_app() {
  if [ -z "$1" ]
  then
    echo "Please provide a name for your project directory"
  else
    cp -r ~/react_app_starter_kit_clone/. $1
  fi
}

newgo() {
  filename="${1}.go"

  if test -f $filename
  then
    vim $filename
  else
    touch $filename
    echo -e "package main\n\nimport (\n  \"fmt\"\n)\n\nfunc main() {\n\n}" >> $filename
    vim $filename
  fi
}

# Aliases and actions from .bash_profile so they run in the VSC integrated terminal

fortune | cowsay

alias abc="tolsdir rb101 3"

alias ..="cdl .."
alias ls="ls -a"
alias codewars="cdl ~/learn_to_code/codewars"
alias euler="cdl ~/learn_to_code/project_euler"
alias studyvim="cdl ~/learn_to_code/learn_vim"
alias launch="cdl ~/learn_to_code/launch_school"
alias 101="cdl ~/learn_to_code/launch_school/rb101"
alias 109="cdl ~/learn_to_code/launch_school/rb109"
alias 120="tolsdir rb120"
alias 129="cdl ~/learn_to_code/launch_school/rb129"
alias 130="tolsdir rb130"
alias 170="tolsdir ls170"
alias 175="tolsdir rb175"
alias 180="tolsdir ls180"
alias 185="tolsdir rb185"
alias 202="tolsdir ls202"
alias 209="cdl ~/learn_to_code/launch_school/ls209"
alias 210="tolsdir js210"
alias 211="cdl ~/learn_to_code/launch_school/js211"
alias 215="tolsdir ls215"
alias 225="tolsdir js225"
alias 229="cdl ~/learn_to_code/launch_school/js229"
alias 230="tolsdir js230"
alias 239="tolsdir js239"
alias cap="tolsdir capstone"
alias exercises="cdl ~/learn_to_code/launch_school/exercises/js230"
alias projects="cdl ~/learn_to_code/my_projects"
alias spot="cdl ~/learn_to_code/my_projects/the_spot"
alias review="cdl ~/learn_to_code/ls_review"
alias 21="ruby ~/learn_to_code/launch_school/rb120/lesson5/twenty_one/21.rb"
alias limerick="cdl ~/learn_to_code/my_projects/group_limerick"
alias snake="ruby ~/learn_to_code/my_projects/assorted_projects/snake.rb"
alias ber="bundle exec ruby"
alias ccc="cdl ~/ccc_database"
alias cli="cdl ~/learn_to_code/launch_school/cli_class"
alias js2html="/home/oklenz/learn_to_code/ls_review/130_review/js_to_html/lib/js_to_html.rb"

# bash_profile shortcuts
alias bp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias svi="source ~/.vimrc"

# Nice git log formatting
alias glg='git log --color=always --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d %Creset%s"'

# Connect to PostgreSQL. Needed in VSC terminal on launch.
alias postgres="sudo /etc/init.d/postgresql start"

# Open directory in windows explorer
alias open="explorer.exe"
alias ocd="explorer.exe ." # Open Current Directory in windows explorer

alias skel="vim ~/learn_to_code/launch_school/ls202/lesson1/html_skeleton.html"
alias css_reset="vim ~/learn_to_code/launch_school/ls202/reset.css"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
