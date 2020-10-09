
#
# generate.sh
#
# transform model_path destination_path
#

GROUP=M4
FOLDER=COLUNAR-SF-1

MODELS=(

    A-G1
    A-G3

    B-G1
    B-G2
    B-G3

    C-G1
    C-G2
    C-G3

    )

for MODEL in "${MODELS[@]}"
do
    #SIZE=0
    SIZE=$(stat -f%z "/Volumes/Mateus/$FOLDER/$GROUP/a.txt")
    for FILENAME in /Volumes/Mateus/$FOLDER/$GROUP/$GROUP-$MODEL/*.txt
    do
        FILESIZE=$(stat -f%z "$FILENAME")
        SIZE=$(($SIZE+$FILESIZE))
    done
    echo "$GROUP-$MODEL $(($SIZE/1000/1000/1000)) GB"
done
