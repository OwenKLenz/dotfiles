# Get the aliases and functions
# if [ -f ~/.bashrc ]; then
source ~/.bashrc
# fi

# Custom functions
cdl() { cd "$@" && ls -a; } # cd and display new directory info
mkcd() { mkdir "$@" && cd "$@"; }

# Display searchable bash history from the most recent
hist() {
  history | fzf --tac
}

push() {
  if [ ! $1 ] 
  then
    echo "Enter a commit message"
  else
    git add .
    git commit -m "${1}"
    git push
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

fzf_vim() {
  filename=$(fzf)
  vim $filename
}

bind '"\C-f": "fzf_vim\n"'

# Aliases and actions

# To be greeted by a fortune telling cow
fortune | cowsay

alias ..="cdl .."
alias ls="ls -a"
alias cap="tolsdir capstone"
alias ber="bundle exec ruby"

alias docker="sudo docker"

# bash_profile shortcuts
alias bp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vrc="vim ~/.vimrc";
alias svrc="source ~/.vimrc"

#################
## GIT ALIASES ##
#################
# Nice git log formatting
alias glg='git log --color=always --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d %Creset%s"'

# Connect to PostgreSQL.
alias postgres="sudo /etc/init.d/postgresql start"

# Open directory in windows explorer
alias open="explorer.exe"
alias ocd="explorer.exe ." # Open Current Directory in windows explorer

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
