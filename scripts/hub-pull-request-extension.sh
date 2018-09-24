# Find the right head
LOCAL_BRANCH=`git name-rev --name-only HEAD`
REMOTE_BRANCH=`git branch -r | grep "$LOCAL_BRANCH"`
IFS='/' 
read -r REMOTE BLAH <<< "$REMOTE_BRANCH"
IFS=' '

# Trim the remote name
REMOTE=`echo $REMOTE | sed -e 's/^[ \t]*//'`

# Get the full-name of the git remote
REMOTE_FULLNAME=`git remote -v | grep "^$REMOTE" | head -1 | perl -nle 'm/(git@|https:\/\/)github\.com(:|\/)([^\/]+)\/[^(]+\(fetch\)/; print $3'`
HEAD=$REMOTE_FULLNAME:$LOCAL_BRANCH

hub pull-request -h $HEAD $@
