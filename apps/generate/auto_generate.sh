
#
# generate.sh
#
# transform model_path destination_path
#

GROUP=M3

MODELS=(

    M3-A-G1
    M3-A-G3

    M3-B-G1
    M3-B-G2
    M3-B-G3

    M3-C-G1
    M3-C-G2

    )

for MODEL in "${MODELS[@]}"
do
    echo "$MODEL \n\n"
    python3 transform.py ./models/roberio/$MODEL.json /Volumes/Mateus/COLUNAR-SF-10/$GROUP/$MODEL/ 1
done
