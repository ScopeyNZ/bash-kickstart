PROJECT_ROOT='';

while [[ $PWD != '/' && -z $(find $PWD/$PROJECT_ROOT -name ".idea" -maxdepth 1) ]]; do PROJECT_ROOT="$PROJECT_ROOT../"; done;

cd $PROJECT_ROOT
PROJECT_ROOT=$PWD
cd - > /dev/null

VCS_ROOT="${PWD#"$PROJECT_ROOT"}"

sed -i '' '/<\/component>/i\
\ \ \ \ <mapping directory="$PROJECT_DIR$'$VCS_ROOT'" vcs="Git" />
' $PROJECT_ROOT/.idea/vcs.xml
