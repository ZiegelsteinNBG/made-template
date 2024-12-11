bash ./pipeline.sh $0 $1

if [ -e ../data/combinedTable.sqlite ]; then
  echo "File exists"
else
  echo "File does not exist"
fi

