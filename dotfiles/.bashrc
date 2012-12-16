##
# Your previous /Users/dfliess/.bash_profile file was backed up as /Users/dfliess/.bash_profile.macports-saved_2012-05-19_at_12:12:54
##

# MacPorts Installer addition on 2012-05-19_at_12:12:54: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

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

source ~/.colors
function make_my_prompt {
    local user_and_host="\[${Yellow}\]\u@\h"
    local current_location="\[${Cyan}\]\w"
    local git_branch_color="\[${Green}\]"
    local git_branch='`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"`'
    local current_time="\[${Red}\]\t"
    local last_color="\[${off}\]"
    local history_line="\[${Blue}\]\!"

    #local battery="`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`"
    
    local prompt_tail="\[${off}\]\$"

    export PS1="$user_and_host $current_location $git_branch_color$git_branch $current_time \n$history_line $prompt_tail$last_color "

}
make_my_prompt

export HISTCONTROL=ignoredups

. ~/z.sh

#npm -g install jump
#jump >> ~/.bash_profile && source ~/.bash_profile
#jump
