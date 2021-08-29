#
# loader-mateus.sh
#
# sh loader-mateus.sh SF1 CG1-GG1-FDN-F1-SH
#

SF=$1
MODEL_ID=$2

LOADER_PATH=/home/mateus/apps/loader/loader.py
BASE_PATH=/home/mateus/apps/downloader/tmp/$SF/$MODEL_ID
LOAD_TIMES_FILEPATH=/home/mateus/results/raw/$MODEL_ID/times-loads.txt

#######################################################################################
################################################################################## SF=1
#######################################################################################

if [ $SF = "SF1" ]; then

    ###################################################################################
    ########################################################################### CG1-GG1
    ###################################################################################

    if [ $MODEL_ID = "CG1-GG1-FDN-F1-SH" ] || [ $MODEL_ID = "CG1-GG1-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
    fi

    ###################################################################################
    ########################################################################### CG1-GG3
    ###################################################################################

    if [ $MODEL_ID = "CG1-GG3-FDD-F1-SH" ] || [ $MODEL_ID = "CG1-GG3-FDD-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG1-GG3-FDH-F1-SH" ] || [ $MODEL_ID = "CG1-GG3-FDH-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG1-GG3-FDN-F1-SH" ] || [ $MODEL_ID = "CG1-GG3-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    ###################################################################################
    ########################################################################### CG2-GG1
    ###################################################################################

    if [ $MODEL_ID = "CG2-GG1-FDD-F1-SH" ] || [ $MODEL_ID = "CG2-GG1-FDD-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG2-GG1-FDH-F1-SH" ] || [ $MODEL_ID = "CG2-GG1-FDH-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG2-GG1-FDN-F1-SH" ] || [ $MODEL_ID = "CG2-GG1-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    ###################################################################################
    ########################################################################### CG2-GG2
    ###################################################################################

    if [ $MODEL_ID = "CG2-GG2-FDD-F1-SH" ] || [ $MODEL_ID = "CG2-GG2-FDD-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG2-GG2-FDH-F1-SH" ] || [ $MODEL_ID = "CG2-GG2-FDH-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG2-GG2-FDN-F1-SH" ] || [ $MODEL_ID = "CG2-GG2-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
    fi

    ###################################################################################
    ########################################################################### CG2-GG3
    ###################################################################################

    if [ $MODEL_ID = "CG2-GG3-FDD-F1-SH" ] || [ $MODEL_ID = "CG2-GG3-FDD-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG2-GG3-FDH-F1-SH" ] || [ $MODEL_ID = "CG2-GG3-FDH-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG2-GG3-FDN-F1-SH" ] || [ $MODEL_ID = "CG2-GG3-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    ###################################################################################
    ########################################################################### CG3-GG1
    ###################################################################################

    if [ $MODEL_ID = "CG3-GG1-FDD-F1-SH" ] || [ $MODEL_ID = "CG3-GG1-FDD-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG3-GG1-FDH-F1-SH" ] || [ $MODEL_ID = "CG3-GG1-FDH-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG3-GG1-FDN-F1-SH" ] || [ $MODEL_ID = "CG3-GG1-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    ###################################################################################
    ########################################################################### CG3-GG2
    ###################################################################################

    if [ $MODEL_ID = "CG3-GG2-FDD-F1-SH" ] || [ $MODEL_ID = "CG3-GG2-FDD-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG3-GG2-FDH-F1-SH" ] || [ $MODEL_ID = "CG3-GG2-FDH-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "CG3-GG2-FDN-F1-SH" ] || [ $MODEL_ID = "CG3-GG2-FDN-FN-SH" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
    fi

fi









