DIR=$(basename $PWD)
git remote add ${3:-cc} git@github.com:${2:-creative-commoners}/${1:-$DIR} ${@:4}
