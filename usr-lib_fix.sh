
FILES="/usr/lib_backup/*"

sourceFileName = "a"
fileName="aa"
fullFileName="aaa"
sourceFileAddress="aaaa"
for f in $FILES
do

        ext=$(echo $f |awk -F . '{if (NF>1) {print $NF}}')
        fullFileName=$(basename $f)
        fileName=$(echo $fullFileName |awk -F . '{if (NF=1) {print $NF}}')

        if [ "$ext" == "la" ]
        then
                #Gets the source .la file name. used to make a symbolic link
                #sourceFileName=$(basename $f)
                #sourceFileName=$(echo $fname |awk -F . '{if (NF=1) {print $NF}}')
                sourceFileAddress=$f
                sourceFileName=$fileName
                #echo $sourceFileAddress

        elif [ "$fileName" == "$sourceFileName"  ]
        then
                fullFileAddress=$f
                rm $f
                ln -s $sourceFileAddress $fullFileAddress
                #echo "     $fullFileAddress"
        fi

done


