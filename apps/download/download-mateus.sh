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

	CG2-GG3-FDD-F1-SH
	CG2-GG3-FDD-FN-SH
	CG2-GG3-FDH-F1-SH
	CG2-GG3-FDH-FN-SH
	CG2-GG3-FDN-F1-SH

	CG3-GG1-FDD-F1-SH
	CG3-GG1-FDD-FN-SH
	CG3-GG1-FDH-F1-SH
	CG3-GG1-FDH-FN-SH
	CG3-GG1-FDN-F1-SH
	CG3-GG1-FDN-FN-SH

	CG3-GG2-FDD-F1-SH
	CG3-GG2-FDD-FN-SH
	CG3-GG2-FDH-F1-SH
	CG3-GG2-FDH-FN-SH
	CG3-GG2-FDN-F1-SH
	CG3-GG2-FDN-FN-SH

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

	https://drive.google.com/file/d/1t-hN-wNHf-y_f1va5BmIcEoLcBZQ9DHk/view?usp=sharing
	https://drive.google.com/file/d/1yEnYRFwrvnCJrNFQQSRc74oW7Q_rqOuo/view?usp=sharing
	https://drive.google.com/file/d/1cvI8stqHpAzLuNnY0uKTVFHCkM8C8568/view?usp=sharing
	https://drive.google.com/file/d/1_aqmLCEZDqReQsPs4uPOZ6iGHR_gWQRe/view?usp=sharing
	https://drive.google.com/file/d/1vMnxg1RIRLWr80WAPKe0cwcO65qLY7j_/view?usp=sharing

	https://drive.google.com/file/d/11dPe1-FT_pounIW6sWmFeT3XK2k4xmC0/view?usp=sharing
	https://drive.google.com/file/d/1XpJEFEDSp2Rq5ajy9Pc9Xq0zqaSIy1D1/view?usp=sharing
	https://drive.google.com/file/d/1beu7IQLp_tihocdp8vnv8pQSQYC2keAi/view?usp=sharing
	https://drive.google.com/file/d/1HpxoXsoc9hPp2qrfGVr89Mk-eSlEykZy/view?usp=sharing
	https://drive.google.com/file/d/1GbQ7DNSvF4Oazo0itmnaqpZXhcbu39bZ/view?usp=sharing
	https://drive.google.com/file/d/1b1yVVug4T5jWrSzbOYX3Sj1rippD4x5A/view?usp=sharing

	https://drive.google.com/file/d/1e-0Zc0TVLwxcfWtlaG181Nj-ZVcPU92a/view?usp=sharing
	https://drive.google.com/file/d/1eNvH0-djjv0gInV8TSMuftYxSo_lK0-0/view?usp=sharing
	https://drive.google.com/file/d/1-7U5JVSehLaHSblZ3D7486XWmSWLZ5Jz/view?usp=sharing
	https://drive.google.com/file/d/1zsI2bME0F-Y_6bcu1SH1vXpN3KuQc1y6/view?usp=sharing
	https://drive.google.com/file/d/1c92EEkTfy1RwMy7SdicgKm86ykQTAu6e/view?usp=sharing
	https://drive.google.com/file/d/1EbQvuEFjPZXPLbyP9-9laqjgWs66s3Kh/view?usp=sharing

	)

SF10_LINKS=(

	https://drive.google.com/file/d/1GTBmzjbYuc3kdY_8pqgi0XjHHJ04OgFa/view?usp=sharing
	https://drive.google.com/file/d/1Pn5fsoiPcYkaUIagqh04ozUOARxajnYC/view?usp=sharing

	https://drive.google.com/file/d/1nEjmpuAvt1OSszQ0JRe5FVsSDfZQGoEi/view?usp=sharing
	https://drive.google.com/file/d/11Ujk161ro5gHgY-W4PDH72cNr2zG66lY/view?usp=sharing
	https://drive.google.com/file/d/1Tc-DOuhkH3liRXQ9gfaaqHNG-iIr33Wj/view?usp=sharing
	https://drive.google.com/file/d/1EU8sB04Dwgk0HX2bxm9nqeBoAPvum4jn/view?usp=sharing
	https://drive.google.com/file/d/1e9F_6RsT66lqgvdvw9HEVjkpZd6BIsjS/view?usp=sharing
	https://drive.google.com/file/d/1rflUxOg7OYUEs3ztik7XK7ofD_3YyUjq/view?usp=sharing

	https://drive.google.com/file/d/1V5SfvyBMSYUuq3E3mlQof5ppGYCZIkhD/view?usp=sharing
	https://drive.google.com/file/d/1uCFPp4p0XkRyKAhFC1k9rUwbU8PEQ82B/view?usp=sharing
	https://drive.google.com/file/d/1XLMgq53ND4UQ6e0xCs0DbCQRwYfZGTMR/view?usp=sharing
	https://drive.google.com/file/d/1NpbsMC67A41LIoR-4Q8bVEj2m_eMQZ85/view?usp=sharing
	https://drive.google.com/file/d/1e7hMeBDPMPYNudv0z-m26xONvi_N0igf/view?usp=sharing

	https://drive.google.com/file/d/1ETNI-i9VBIrqT0cntzoVNXltqodQulyF/view?usp=sharing
	https://drive.google.com/file/d/1BP42paUpbikKZ6IFsrEprilRXjHDTh73/view?usp=sharing
	https://drive.google.com/file/d/1t9BmeIBeploGqoQIl7kl1xiOhQWwsSM3/view?usp=sharing
	https://drive.google.com/file/d/1dyi5RFS4saNP1FBgRUKKrEw5_QzWVuCb/view?usp=sharing
	https://drive.google.com/file/d/18wjqjcpSbq5yh7KE2eZL87RzttDmUUmy/view?usp=sharing
	https://drive.google.com/file/d/1JAdGPqtywYCXc34ZkWM6LZj8x2DeL9Ug/view?usp=sharing

	https://drive.google.com/file/d/1P5TQTDlczIqS5Wy-6NzY5UI0cUv-bO0x/view?usp=sharing
	https://drive.google.com/file/d/1fXmYFtcWj6m5n9IyxRrnlLT1syJZwA5j/view?usp=sharing
	https://drive.google.com/file/d/15J2ykrLVkDY2zJVoEn1YBVFJXHMDhw9p/view?usp=sharing
	https://drive.google.com/file/d/1JwNkjepBe0NIWzzB32Syf9uUbwX0c6Q0/view?usp=sharing
	https://drive.google.com/file/d/1aUI6UsP2pxdd0QNmX5iNMRk3cA2Ubo36/view?usp=sharing

	https://drive.google.com/file/d/1IZ3jUcmr0AE6NjO9UIl653oONx5reioV/view?usp=sharing
	https://drive.google.com/file/d/1pRaT_Kb_pCrJpqZdd8EfAjVjTZ4MI42C/view?usp=sharing
	https://drive.google.com/file/d/16yHJ5r18IT0mJG-V4UNQpktIt1wmf4R6/view?usp=sharing
	https://drive.google.com/file/d/1QhMcy6_zy41FvNTh202nkWvm78F5Md62/view?usp=sharing
	https://drive.google.com/file/d/1j89P9sxbPwpRgrhS-0m04zzeNz17ObNl/view?usp=sharing
	https://drive.google.com/file/d/16YSp41C5WeeJbaokhofe5Ib3ThEEyBSn/view?usp=sharing

	https://drive.google.com/file/d/1TtYI4_PeMQpB8xb9Fi9cTV4Lds3OqpUe/view?usp=sharing
	https://drive.google.com/file/d/1V9IQfKZbOfriVB1b_GS05aEh_W3IUfL9/view?usp=sharing
	https://drive.google.com/file/d/1BRkOKtP__U74EAPhn0dara7BMtZEHZZh/view?usp=sharing
	https://drive.google.com/file/d/19OMbzaqRfSaxm2ItTHL6aCwRHPNBQFxA/view?usp=sharing
	https://drive.google.com/file/d/1Z7a6SJIaAPA4ZteT9fXOXcyrnKI3tgl6/view?usp=sharing
	https://drive.google.com/file/d/1404R3Fx3tvSXlQE_C4OtcKnlhgn3ZiLR/view?usp=sharing

	)


SF=$1
MODEL_ID=$2


if [ $SF = "SF1" ]; then

	for i in {0..35}; do if [ $MODEL_ID = ${MODELS[$i]} ]; then LINK=${SF1_LINKS[$i]}; fi done

fi

if [ $SF = "SF10" ]; then

	for i in {0..35}; do if [ $MODEL_ID = ${MODELS[$i]} ]; then LINK=${SF10_LINKS[$i]}; fi done

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















