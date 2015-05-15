# terminal color customization
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedaxagaccx

# aliases!
alias workoff="deactivate"
alias textedit="open -a TextEdit"

# short folder names
export course=$HOME/Documents/Coursera/

# Path manipulation, ensures brew installs preferred over system
export PATH=/usr/local/bin:$PATH

# Virtual environment setup stuff
export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python/2.7.7_2/bin/python2.7
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# boot2docker setup
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
#export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):$(boot2docker config | grep DockerPort | awk '{print $3}')

# Maven setup
export MAVEN_OPTS="-Xmx4096m -Xss1024m -XX:MaxPermSize=128m"
export ANT_OPTS="-Xms512m -Xmx1024m"

# Java version
export JAVA_HOME="/usr"

############ FUNCTIONS ###########

git()
{
  if ([ "$1" == "push" ] || [ "$1" == "pull" ]) && [ "${*: -1}" == "self" ]; then
     current_branch=$(git rev-parse --abbrev-ref HEAD)
     git ${*: 1:($# - 1)} $current_branch
  elif [ "$1" == "update" ] && [ "$2" == "master" ]; then
     git checkout master
     git pull upstream master
     git push origin master
     git branch --merged | grep -v "\*" | grep -v 'master$' | xargs -n 1 git push --delete origin
     git remote prune origin
     git branch --merged master | grep -v 'master$' | xargs -n 1 git branch -d
  else
     command git "$@"
  fi
}

# The next line updates PATH for the Google Cloud SDK.
source '/Users/amandeepgill/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/amandeepgill/google-cloud-sdk/completion.bash.inc'

# This variable added because gcutil pull wasn't working without it
export CLOUDSDK_PYTHON_SITEPACKAGES=1
