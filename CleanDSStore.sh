#remove DS_Dtore files created by MAC OS
#yanni4night@gmail.com

d="$1"
if [ "x$d" = 'x' ];then
    d='.'
fi

echo "searching $d"

for f in `find $d -name '.DS_Store' -o -name '._.DS_Store' -type -f`
do
    echo "removing $f..."
    rm -f "$f"
done
echo "done"