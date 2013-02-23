# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
for file in ~/.{colors,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

default_username='dfliess'
default_hostname='mbp-daf.local'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'


#if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
#      . /opt/local/share/git-core/git-prompt.sh
#fi

function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Only show username/host if not default
function usernamehost() {
    if [ $USER != $default_username ]; then echo -e "${Yellow}$USER\c"; fi
    if [ $HOSTNAME != $default_hostname ]; then echo "@$HOSTNAME "; fi    
}


function make_my_prompt() {
    #local user_and_host="\[${Yellow}\]\u@\h"
    local user_and_host=usernamehost
    local current_location="\[${Cyan}\]\w"
    local git_branch_color="\[${Green}\]"
    #local git_branch='`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"`'
    local current_time="\[${Red}\]\t"
    local last_color="\[${off}\]"
    local history_line="\[${Blue}\]\!"

    #local battery="`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`"
    
    local prompt_tail="\[${off}\]\$"

    export PS1="$(usernamehost) $current_location $git_branch_color\$(parse_git_branch) $current_time \n$history_line $prompt_tail$last_color "

}
make_my_prompt

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# timestamps for bash history. www.debian-administration.org/users/rossen/weblog/1
# saved for later analysis
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd;exit:date:* --help"


. ~/z.sh

#After upgrading to Mac OS Lion git push had some locale warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#npm -g install jump
#jump >> ~/.bash_profile && source ~/.bash_profile
#jump
