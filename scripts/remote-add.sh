HELP="Usage: `basename $0` [-hs]\n
\n
Options:\n
	-h 	Show this help text\n
	-s 	Skip checking the remote is valid"

while getopts ":hs" opt; do
  case $opt in
    s)
      SKIPCHECK=1
      ;;
 	h)
      echo -e $HELP
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      echo -e $HELP
      exit 1
      ;;
  esac
done
shift $(($OPTIND - 1))

TEAM=${2:-creative-commoners}
REMOTENAME=${1:-cc}
REPO=$3

if [[ -z $REPO ]] ; then
	if ! ORIGIN=`git remote -v | head -1 | grep -oP '(?<=github.com[/:])([^/.]+/(?:[^\s](?!git))+)' | sed -E "s/[^\/]+/$TEAM/"`; then
		echo "Could not determine remote. Please provide a remote: "
		read REMOTE
	else 
		REMOTE="git@github.com:$ORIGIN"
	fi
else
	REMOTE="git@github.com:$TEAM/$REPO"
fi

HTTPSREMOTE=`echo $REMOTE | sed 's/git@github.com:/https:\/\/github.com\//'`

if [[ $SKIPCHECK -ne 1 ]] && ! `git ls-remote -h $HTTPSREMOTE &> /dev/null` ; then
	echo $HTTPSREMOTE" does not appear to be a valid remote. Maybe you should fork first (hub fork)"
else
	git remote add $REMOTENAME $REMOTE
	echo "Added remote \"$REMOTENAME\": "$REMOTE
fi

