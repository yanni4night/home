files=$(find ~/Music -name '*.mp3' -type f | awk '{if(!match($1,/iTunes/)){print $0}}')
if [ 'Darwin' = `uname` ];then
    for f in $files;
    do
        mv $f "~/Music/iTunes/iTunes\ Media/Automatically\ Add\ to\ iTunes.localized/$f"
    done
else
    echo "You are not running Mac OS"
fi
