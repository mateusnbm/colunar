#
#!/bin/bash
#
# download-mateus.sh
#
# sh download-mateus.sh SF1 CG1-GG1-FDN-F1-SH
#

MODELS=(

	CG1-GG1-FDN-F1-SH
	CG1-GG1-FDN-FN-SH

	CG1-GG3-FDD-F1-SH
	CG1-GG3-FDD-FN-SH
	CG1-GG3-FDH-F1-SH
	CG1-GG3-FDH-FN-SH
	CG1-GG3-FDN-F1-SH
	CG1-GG3-FDN-FN-SH

	CG2-GG1-FDD-F1-SH
	CG2-GG1-FDD-FN-SH
	CG2-GG1-FDH-F1-SH
	CG2-GG1-FDH-FN-SH
	CG2-GG1-FDN-F1-SH

	CG2-GG2-FDD-F1-SH
	CG2-GG2-FDD-FN-SH
	CG2-GG2-FDH-F1-SH
	CG2-GG2-FDH-FN-SH
	CG2-GG2-FDN-F1-SH
	CG2-GG2-FDN-FN-SH

	)

SF1_LINKS=(

	https://drive.google.com/file/d/1fIvytHoYVeDHBtAUaW3nE6qT6yfGEAow/view?usp=sharing
	https://drive.google.com/file/d/1Y4RJUZyUaUH-mH_oRcDZqdptfZnGhzZV/view?usp=sharing

	https://drive.google.com/file/d/1PDIhBfdlfsMbc9alI0zI6zzv-aAUCzfs/view?usp=sharing
	https://drive.google.com/file/d/1-Tczh9wSpFLbXZSIqoRljgzLBz3QREG0/view?usp=sharing
	https://drive.google.com/file/d/1r7coyGYeS4kGTY5i9S0GL-vXHI6H_Mi0/view?usp=sharing
	https://drive.google.com/file/d/1hd9lQmp7zuKpZWAKN0cuS81g8T35-si-/view?usp=sharing
	https://drive.google.com/file/d/1cevv69q8gz8jwXJMWvPNtTNHyXIF20_t/view?usp=sharing
	https://drive.google.com/file/d/1Ey9wmvRI-xZvQMng6Y6ZX2-Dxgcyoewh/view?usp=sharing

	https://drive.google.com/file/d/1EGdj8z9opN2UJKwXYPwf6gHWoBmLRdgg/view?usp=sharing
	https://drive.google.com/file/d/17j5KyAQWaP1WZegjcVtM6I-OZDQGAQ0S/view?usp=sharing
	https://drive.google.com/file/d/1UG7DP5ZC82DqZIQyOzA14IOA_aWyZ-IC/view?usp=sharing
	https://drive.google.com/file/d/1Mk7sN2O33-AbgoNQhDrMgHaJP8Vw9Le8/view?usp=sharing
	https://drive.google.com/file/d/1H9ktVwto8cwb-zRto6dxt7OWIh_t9wyv/view?usp=sharing

	https://drive.google.com/file/d/1EF707g7v-CHJjK9TfcG3DcQm9tN7H6ZV/view?usp=sharing
	https://drive.google.com/file/d/1YwUOQ2UfRiWVbFd6XS5vwSYmwzjYDoan/view?usp=sharing
	https://drive.google.com/file/d/19NSiLZMiOmiHd4ct1-1nWNdOEVFjlPBe/view?usp=sharing
	https://drive.google.com/file/d/1xD6rrqmAECF0oXB3klJm01uiFND0jsko/view?usp=sharing
	https://drive.google.com/file/d/1j2XHLLfCxsXVvqRA_IU3hJ2ikxLr_NDv/view?usp=sharing
	https://drive.google.com/file/d/1rxgsqadzwOtrGC6Lv1q3WTwex9FuQDsd/view?usp=sharing

	)

SF10_LINKS=(

	CG1-GG1-FDN-F1-SH
	CG1-GG1-FDN-FN-SH

	CG1-GG3-FDD-F1-SH
	CG1-GG3-FDD-FN-SH
	CG1-GG3-FDH-F1-SH
	CG1-GG3-FDH-FN-SH
	CG1-GG3-FDN-F1-SH
	CG1-GG3-FDN-FN-SH

	CG2-GG1-FDD-F1-SH
	CG2-GG1-FDD-FN-SH
	CG2-GG1-FDH-F1-SH
	CG2-GG1-FDH-FN-SH
	CG2-GG1-FDN-F1-SH

	CG2-GG2-FDD-F1-SH
	CG2-GG2-FDD-FN-SH
	CG2-GG2-FDH-F1-SH
	CG2-GG2-FDH-FN-SH
	CG2-GG2-FDN-F1-SH
	CG2-GG2-FDN-FN-SH

	)


SF=$1
MODEL_ID=$2


if [ $SF = "SF1" ]; then

	for i in {0..18}; do if [ $MODEL_ID = ${MODELS[$i]} ]; then LINK=${SF1_LINKS[$i]}; fi done

fi

if [ $SF = "SF10" ]; then

	for i in {0..18}; do if [ $MODEL_ID = ${MODELS[$i]} ]; then LINK=${SF10_LINKS[$i]}; fi done

fi


FILE_ID=$( basename $( dirname $LINK ) )
FILE_NAME="./tmp/$SF/$MODEL_ID/$MODEL_ID.7z"


if [ ! -d ./tmp ]; then mkdir tmp; fi
if [ ! -d ./tmp/$SF ]; then mkdir tmp/$SF; fi
if [ ! -d ./tmp/$SF ]; then mkdir tmp/$SF; fi
if [ ! -d ./tmp/$SF/$MODEL_ID ]; then mkdir tmp/$SF/$MODEL_ID; else rm -rf tmp/$SF/$MODEL_ID/*; fi


echo ""
echo "Model: $MODEL_ID"
echo "Url: $LINK"
echo "Destination path: $FILE_NAME"
echo ""


curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${FILE_ID}" -o ${FILE_NAME}
rm -rf cookie

7z x $FILE_NAME

mv ./$MODEL_ID/* ./tmp/$SF/$MODEL_ID/
rm -rf ./$MODEL_ID

echo ""















