. ~/.bashrc
###begin-jump-bash_profile
#
# Installation:
#
# jump >> ~/.bash_profile && source ~/.bash_profile
#

function jump {
  local si="$IFS";
  IFS=$'\n';
  local newDir=$(JUMPPROFILE=1 command jump "$@");
  cd "$newDir";
  IFS="$si";
}
alias j="jump -a"

###end-jump-bash_profile
