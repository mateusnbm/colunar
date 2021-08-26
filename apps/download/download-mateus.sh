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

	)

SF1_LINKS=(

	https://drive.google.com/file/d/1fIvytHoYVeDHBtAUaW3nE6qT6yfGEAow/view?usp=sharing
	CG1-GG1-FDN-FN-SH

	)

SF10_LINKS=(

	CG1-GG1-FDN-F1-SH
	CG1-GG1-FDN-FN-SH

	)


SF=$1
MODEL_ID=$2


if [ $SF = "SF1" ]; then

	for i in {0..2}; do if [ $MODEL_ID = ${MODELS[$i]} ]; then LINK=${SF1_LINKS[$i]}; fi done

fi

if [ $SF = "SF10" ]; then

	for i in {0..2}; do if [ $MODEL_ID = ${MODELS[$i]} ]; then LINK=${SF10_LINKS[$i]}; fi done

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















