#branch=`git br | awk '{if($1=="*"){print $2}}'`
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

opt='push'

if [ $branch = '' ];then
  echo "\033[0;31mCannot find current branch\033[0m"  
  exit
fi

if [ "$1" != 'push' ] && [ "$1" != 'pull' ];then
    echo "\033[0;31mYou can do push or pull,not \"$1\"\033[0m"
    exit
else
    opt=$1
fi

echo "\033[0;32mgit $opt origin $branch\033[0m"
git $opt origin $branch
