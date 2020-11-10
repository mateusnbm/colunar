#!/bin/bash
#
# download.sh
#
# sh download.sh SF1 M4-C-G1
#

M1_MODELS=(

	M1-A-G3
	
	M1-B-G1
	M1-B-G2
	M1-B-G3

	M1-C-G1
	M1-C-G2
	M1-C-G3

	)

M2_MODELS=(

	M2-A-G1
	M2-A-G3

	M2-B-G1
	M2-B-G2
	M2-B-G3

	M2-C-G1
	M2-C-G2
	M2-C-G3

	)

M3_MODELS=(

	M3-X-XX

	M3-A-G1
	M3-A-G3

	M3-B-G1
	M3-B-G2
	M3-B-G3

	M3-C-G1
	M3-C-G2
	M3-C-G3

	)

M4_MODELS=(

	M4-X-XX

	M4-A-G1
	M4-A-G3

	M4-B-G1
	M4-B-G2
	M4-B-G3

	M4-C-G1
	M4-C-G2
	M4-C-G3

	)

M1_SF1_LINKS=(

	https://drive.google.com/file/d/1p_227yHe6TBuzMhLQ4HQbm8T0sgAGXtj/view?usp=sharing
	
	https://drive.google.com/file/d/1vphYrjf5gZuifFo6A9Yoxjw0bN0yYK03/view?usp=sharing
	https://drive.google.com/file/d/1q--Pn5Yyt45cb8zDoY0p-ZiXaGp1AzMj/view?usp=sharing
	https://drive.google.com/file/d/1VKcN-4hzY0JvsIpteFg226cdV0_6oQ3z/view?usp=sharing

	https://drive.google.com/file/d/1-fjmPzyYlzKaWejFs43WQnmZgYYdSPc9/view?usp=sharing
	https://drive.google.com/file/d/1FGfmQ0vrOEqX83NBtOvVKEfVX6z09A5w/view?usp=sharing
	https://drive.google.com/file/d/1WaL9DQT4hZ5spCTEEUuIMxgqpd5GqcDG/view?usp=sharing

	)

M2_SF1_LINKS=(

	https://drive.google.com/file/d/10a9YpQf-Gfuj6ysmLWBwfOaXgnYv_qoA/view?usp=sharing
	https://drive.google.com/file/d/1Y2hhZ5r6aaxtZUAspG0nZfZvt8rVyElX/view?usp=sharing

	https://drive.google.com/file/d/1ywht8hU7sxp79pG80ZF-0nllWvA0rVc8/view?usp=sharing
	https://drive.google.com/file/d/1o4RfWQ4aS6-NfXU-nyhDxovgomdhLIGL/view?usp=sharing
	https://drive.google.com/file/d/1GKhvP78lU7olpde_L85igEMrYFZYCosu/view?usp=sharing

	https://drive.google.com/file/d/16nkpc-Celk4ST7vbhn_bArIXKUzjyP-F/view?usp=sharing
	https://drive.google.com/file/d/1eBZriZQu8-OnMzhiYtswpZAV7GPvkQwy/view?usp=sharing
	https://drive.google.com/file/d/1KMovPQEIXC3rGs0-5jxErlnwuwaiHQFB/view?usp=sharing

	)

M3_SF1_LINKS=(

	https://drive.google.com/file/d/1HvRKucr1uCozGq18o4jcg-JfmZv6PLZg/view?usp=sharing

	https://drive.google.com/file/d/1mOpGNrCCmkBLQjJwasB0CW8AS0ko6Nmm/view?usp=sharing
	https://drive.google.com/file/d/1vkjZRlOXdN2w4QOD3JDtNx1jwz5Xg_dV/view?usp=sharing

	https://drive.google.com/file/d/1y_GFuuzTmJkPgVbE4ZFY4-AIoeNXpFpG/view?usp=sharing
	https://drive.google.com/file/d/1wmRXTKyVfYHW8Hu5rtIgqStH9J4buxiL/view?usp=sharing
	https://drive.google.com/file/d/16nlxq5UkUoTnHRZivLX2fLU4jZ_L5yER/view?usp=sharing

	https://drive.google.com/file/d/1RK-rhLi2ii8y9OsXp9pmHq_GjpAj8g9l/view?usp=sharing
	https://drive.google.com/file/d/11luzx1VeURd3g93JMOrnzMH9toRl3fuL/view?usp=sharing
	https://drive.google.com/file/d/1kVXHDm7qkr62zBLD3mfGZiOnqLj-EiJ3/view?usp=sharing

	)

M4_SF1_LINKS=(

	https://drive.google.com/file/d/1nUo6tXrTi7nmxjJeeKdO5pC-qNUZ9d7t/view?usp=sharing

	https://drive.google.com/file/d/1qKjXPKOF_ZRHuh3PcMs6FrAt9Z51qaHz/view?usp=sharing
	https://drive.google.com/file/d/1tWEPV24aVLa_H1OuEi1J1w2P-FTlcqKx/view?usp=sharing

	https://drive.google.com/file/d/16sgDqrKb4-LuYWf_m_0dcHHFcR8Z3_JB/view?usp=sharing
	https://drive.google.com/file/d/1K6cGh1JwdV8pctluQb5IYYfzaV5Qqf_1/view?usp=sharing
	https://drive.google.com/file/d/1r7UfyNWcAmnj1__K8fZeUZhWOtdsuA20/view?usp=sharing

	https://drive.google.com/file/d/1xWdSUII5BdPBwlK4Kv5Uz5xdg31e-PyN/view?usp=sharing
	https://drive.google.com/file/d/1zK8BF6EzJhQueKrG_I9TIQ-ug9i4uU2H/view?usp=sharing
	https://drive.google.com/file/d/1Cw3Vi47zsQBj2WWUjXjAM0cly8hA6_46/view?usp=sharing

	)

M4_SF10_LINKS=(

	https://drive.google.com/file/d/1prGYnTLxaFs6jUAg51VowoxadElADzJj/view?usp=sharing

	https://drive.google.com/file/d/1yybys1xK6lLMtGvip27TxLHFizjgKwOq/view?usp=sharing
	https://drive.google.com/file/d/1rB1I0PQIemYzyjxt5VyPf1LrIiFZo3tP/view?usp=sharing

	https://drive.google.com/file/d/1LkZ2APZlI0RK_lEeUXADYBa3HkDBU2Sz/view?usp=sharing
	https://drive.google.com/file/d/12PhByuXIgfDsFEvd2UcOZTm9GJhSulFj/view?usp=sharing
	https://drive.google.com/file/d/1YuWGThxWCmEeYWzYaHiNqpjran2hL6DL/view?usp=sharing

	https://drive.google.com/file/d/1ngDVb9sQi-6j7WiiFWTqtvW9BhuVsrw6/view?usp=sharing
	https://drive.google.com/file/d/11goWMqIirQ9jJH9_Bt-VWWu9830HX3B6/view?usp=sharing
	https://drive.google.com/file/d/1qqulHLItHaT_2q1YM1lt64o8R__bwEeb/view?usp=sharing

	)

SF=$1
MODEL_ID=$2
MODEL_P0=$( echo $MODEL_ID | cut -c1-2 )
MODEL_P1=$( echo $MODEL_ID | cut -c4-4 )
MODEL_P2=$( echo $MODEL_ID | cut -c6-7 )

if [ $SF = "SF1" ]; then

	for i in {0..6}; do if [ $MODEL_ID = ${M1_MODELS[$i]} ]; then LINK=${M1_SF1_LINKS[$i]}; fi done
	for i in {0..7}; do if [ $MODEL_ID = ${M2_MODELS[$i]} ]; then LINK=${M2_SF1_LINKS[$i]}; fi done
	for i in {0..8}; do if [ $MODEL_ID = ${M3_MODELS[$i]} ]; then LINK=${M3_SF1_LINKS[$i]}; fi done
	for i in {0..8}; do if [ $MODEL_ID = ${M4_MODELS[$i]} ]; then LINK=${M4_SF1_LINKS[$i]}; fi done

fi

if [ $SF = "SF10" ]; then

	for i in {0..6}; do if [ $MODEL_ID = ${M1_MODELS[$i]} ]; then LINK=${M4_SF10_LINKS[$i]}; fi done
	for i in {0..7}; do if [ $MODEL_ID = ${M2_MODELS[$i]} ]; then LINK=${M4_SF10_LINKS[$i]}; fi done
	for i in {0..8}; do if [ $MODEL_ID = ${M3_MODELS[$i]} ]; then LINK=${M4_SF10_LINKS[$i]}; fi done
	for i in {0..8}; do if [ $MODEL_ID = ${M4_MODELS[$i]} ]; then LINK=${M4_SF10_LINKS[$i]}; fi done

fi

FILE_ID=$( basename $( dirname $LINK ) )
FILE_NAME="./tmp/$SF/$MODEL_P0/$MODEL_ID/$MODEL_ID.7z"

if [ ! -d ./tmp ]; then mkdir tmp; fi
if [ ! -d ./tmp/$SF ]; then mkdir tmp/$SF; fi
if [ ! -d ./tmp/$SF/$MODEL_P0 ]; then mkdir tmp/$SF/$MODEL_P0; fi
if [ ! -d ./tmp/$SF/$MODEL_P0/$MODEL_ID ]; then mkdir tmp/$SF/$MODEL_P0/$MODEL_ID; else rm -rf tmp/$SF/$MODEL_P0/$MODEL_ID/*; fi

echo ""
echo "Model: $MODEL_ID"
echo "Url: $LINK"
echo "Destination path: $FILE_NAME"
echo ""

curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${FILE_ID}" -o ${FILE_NAME}
rm -rf cookie

7z x $FILE_NAME

mv ./$MODEL_ID/* ./tmp/$SF/$MODEL_P0/$MODEL_ID/
rm -rf ./$MODEL_ID

echo ""
echo "Computing checksums..."
echo ""

for FILE in ./tmp/$SF/$MODEL_P0/$MODEL_ID/*.txt; do

	RESULT="ERROR"

	TRUTH_TABLE_PATH="./checksums/SF1-ALL.txt"
	TRUTH_TABLE_ID="$MODEL_ID $( basename $FILE )"
	TRUTH_TABLE_LINE=$( grep "^$TRUTH_TABLE_ID" $TRUTH_TABLE_PATH )
	TRUTH_TABLE_COMPONENTS=($TRUTH_TABLE_LINE)
	TRUTH_TABLE_SUM=${TRUTH_TABLE_COMPONENTS[2]}

	DOWNLOADED_FILE_SUM=$(shasum $FILE | cut -d " " -f 1)

	if [ $TRUTH_TABLE_SUM = $DOWNLOADED_FILE_SUM ]; then RESULT="MATCH"; fi

	echo "$MODEL $(basename $FILE) $DOWNLOADED_FILE_SUM $TRUTH_TABLE_SUM $RESULT"

done

echo ""















