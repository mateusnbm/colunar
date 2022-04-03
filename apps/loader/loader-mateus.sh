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

if [ $SF = "SF10" ]; then

    ###################################################################################
    ########################################################################### CG1-GG1
    ###################################################################################

    if [ $MODEL_ID = "CG1-GG1-FDN-F1-SH" ] || [ $MODEL_ID = "CG1-GG1-FDN-FN-SH" ]; then
        
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-0.7z
        python3 $LOADER_PATH c-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf c-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-1.7z
        python3 $LOADER_PATH c-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-2.7z
        python3 $LOADER_PATH c-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-3.7z
        python3 $LOADER_PATH c-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-4.7z
        python3 $LOADER_PATH c-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-5.7z
        python3 $LOADER_PATH c-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-6.7z
        python3 $LOADER_PATH c-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-7.7z
        python3 $LOADER_PATH c-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-8.7z
        python3 $LOADER_PATH c-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/c-9.7z
        python3 $LOADER_PATH c-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-9.txt

        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1

    fi

    ###################################################################################
    ########################################################################### CG1-GG3
    ###################################################################################

    if [ $MODEL_ID = "CG1-GG3-FDD-F1-SH" ] || [ $MODEL_ID = "CG1-GG3-FDD-FN-SH" ]; then
        
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-0.7z
        python3 $LOADER_PATH a-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf a-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-1.7z
        python3 $LOADER_PATH a-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-2.7z
        python3 $LOADER_PATH a-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-3.7z
        python3 $LOADER_PATH a-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-4.7z
        python3 $LOADER_PATH a-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-5.7z
        python3 $LOADER_PATH a-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-5.txt

        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG1-GG3-FDH-F1-SH" ] || [ $MODEL_ID = "CG1-GG3-FDH-FN-SH" ]; then
        
        #python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1

        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-0.7z
        #python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf b-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-1.7z
        #python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-2.7z
        #python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-3.7z
        #python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-4.7z
        #python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-5.7z
        python3 $LOADER_PATH b-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-5.txt

        #python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
        
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

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-0.7z
        python3 $LOADER_PATH a-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf a-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-1.7z
        python3 $LOADER_PATH a-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-2.7z
        python3 $LOADER_PATH a-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-3.7z
        python3 $LOADER_PATH a-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-4.7z
        python3 $LOADER_PATH a-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-5.7z
        python3 $LOADER_PATH a-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-5.txt

        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG2-GG1-FDH-F1-SH" ] || [ $MODEL_ID = "CG2-GG1-FDH-FN-SH" ]; then
        
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-0.7z
        python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf b-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-1.7z
        python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-2.7z
        python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-3.7z
        python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-4.7z
        python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-4.txt

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
        
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-0.7z
        #python3 $LOADER_PATH a-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf a-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-1.7z
        #python3 $LOADER_PATH a-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-2.7z
        #python3 $LOADER_PATH a-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-3.7z
        #python3 $LOADER_PATH a-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-4.7z
        #python3 $LOADER_PATH a-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-4.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-5.7z
        #python3 $LOADER_PATH a-5.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-5.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-0.7z
        python3 $LOADER_PATH f-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf f-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-1.7z
        python3 $LOADER_PATH f-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-2.7z
        python3 $LOADER_PATH f-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-3.7z
        python3 $LOADER_PATH f-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-4.7z
        python3 $LOADER_PATH f-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-5.7z
        python3 $LOADER_PATH f-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-6.7z
        python3 $LOADER_PATH f-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-7.7z
        python3 $LOADER_PATH f-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-8.7z
        python3 $LOADER_PATH f-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-9.7z
        python3 $LOADER_PATH f-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-9.txt

        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG2-GG2-FDH-F1-SH" ] || [ $MODEL_ID = "CG2-GG2-FDH-FN-SH" ]; then
        
        #python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1

        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-0.7z
        #python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf b-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-1.7z
        #python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-2.7z
        #python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-3.7z
        #python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-4.7z
        #python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-4.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-0.7z
        python3 $LOADER_PATH f-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf f-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-1.7z
        python3 $LOADER_PATH f-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-2.7z
        python3 $LOADER_PATH f-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-3.7z
        python3 $LOADER_PATH f-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-4.7z
        python3 $LOADER_PATH f-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-5.7z
        python3 $LOADER_PATH f-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-6.7z
        python3 $LOADER_PATH f-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-7.7z
        python3 $LOADER_PATH f-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-8.7z
        python3 $LOADER_PATH f-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-9.7z
        python3 $LOADER_PATH f-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-9.txt

        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG2-GG2-FDN-F1-SH" ] || [ $MODEL_ID = "CG2-GG2-FDN-FN-SH" ]; then
        
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-0.7z
        python3 $LOADER_PATH f-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf f-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-1.7z
        python3 $LOADER_PATH f-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-2.7z
        python3 $LOADER_PATH f-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-3.7z
        python3 $LOADER_PATH f-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-4.7z
        python3 $LOADER_PATH f-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-5.7z
        python3 $LOADER_PATH f-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-6.7z
        python3 $LOADER_PATH f-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-7.7z
        python3 $LOADER_PATH f-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-8.7z
        python3 $LOADER_PATH f-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/f-9.7z
        python3 $LOADER_PATH f-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-9.txt

        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1

    fi

    ###################################################################################
    ########################################################################### CG2-GG3
    ###################################################################################

    if [ $MODEL_ID = "CG2-GG3-FDD-F1-SH" ] || [ $MODEL_ID = "CG2-GG3-FDD-FN-SH" ]; then
        
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-0.7z
        python3 $LOADER_PATH a-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf a-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-1.7z
        #python3 $LOADER_PATH a-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-2.7z
        #python3 $LOADER_PATH a-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-3.7z
        #python3 $LOADER_PATH a-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-4.7z
        #python3 $LOADER_PATH a-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-4.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-5.7z
        #python3 $LOADER_PATH a-5.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-5.txt

        #python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1

        #python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG2-GG3-FDH-F1-SH" ] || [ $MODEL_ID = "CG2-GG3-FDH-FN-SH" ]; then
        
        #python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1

        # ...

        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-0.7z
        #python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf b-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-1.7z
        #python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-2.7z
        #python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-3.7z
        #python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-4.7z
        python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-4.txt

        # ...

        #python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1

        #python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1

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
        
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-0.7z
        #python3 $LOADER_PATH a-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf a-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-1.7z
        #python3 $LOADER_PATH a-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-2.7z
        #python3 $LOADER_PATH a-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-3.7z
        #python3 $LOADER_PATH a-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-4.7z
        #python3 $LOADER_PATH a-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-5.7z
        python3 $LOADER_PATH a-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-5.txt

        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG3-GG1-FDH-F1-SH" ] || [ $MODEL_ID = "CG3-GG1-FDH-FN-SH" ]; then
        
        #python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1

        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-0.7z
        python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf b-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-1.7z
        python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-2.7z
        #python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-3.7z
        #python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-4.7z
        #python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-4.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-5.7z
        #python3 $LOADER_PATH b-5.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-5.txt

        #python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        #python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1

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
        
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-0.7z
        #python3 $LOADER_PATH a-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf a-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-1.7z
        #python3 $LOADER_PATH a-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-2.7z
        #python3 $LOADER_PATH a-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-3.7z
        #python3 $LOADER_PATH a-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-4.7z
        #python3 $LOADER_PATH a-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf a-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/a-5.7z
        python3 $LOADER_PATH a-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf a-5.txt

        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1

    fi

    if [ $MODEL_ID = "CG3-GG2-FDH-F1-SH" ] || [ $MODEL_ID = "CG3-GG2-FDH-FN-SH" ]; then
        
        #python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1

        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-0.7z
        #python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf b-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-1.7z
        #python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-2.7z
        #python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-3.7z
        #python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-4.7z
        #python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf b-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/$MODEL_ID/b-5.7z
        python3 $LOADER_PATH b-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-5.txt

        #python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1

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









