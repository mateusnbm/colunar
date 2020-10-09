
#
# generate.sh
#
# transform model_path destination_path
#

OUTPUT=./checksums/SF1-M4.txt

GROUP=M4
FOLDER=COLUNAR-SF-1

MODELS=(

    X-XX

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
    for FILENAME in /Volumes/Mateus/$FOLDER/$GROUP/$GROUP-$MODEL/*.txt
    do
        echo "$GROUP-$MODEL $(basename $FILENAME) $(shasum $FILENAME | cut -d " " -f 1 )" >> $OUTPUT
    done
    echo "\n" >> $OUTPUT
done
