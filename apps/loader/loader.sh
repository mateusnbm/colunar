#
# loader.sh
#
# sh loader.sh SF1 M3-A-G1
#

SF=$1
MODEL_ID=$2

MODEL_P0=$( echo $MODEL_ID | cut -c1-2 )
MODEL_P1=$( echo $MODEL_ID | cut -c4-4 )
MODEL_P2=$( echo $MODEL_ID | cut -c6-7 )

LOADER_PATH=/home/mateus/apps/loader/loader.py
BASE_PATH=/home/mateus/apps/downloader/tmp/$SF/$MODEL_P0/$MODEL_ID
LOAD_TIMES_FILEPATH=/home/mateus/results/raw/$MODEL_P0$MODEL_P1$MODEL_P2/times-loads.txt

###########################################################################
###################################################################### SF=1
###########################################################################

if [ $SF = "SF1" ]; then

    #######################################################################
    ################################################################## M1-A
    #######################################################################

    if [ $MODEL_ID = "M1-A-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M1-B
    #######################################################################

    if [ $MODEL_ID = "M1-B-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M1-B-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M1-B-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M1-C
    #######################################################################


    if [ $MODEL_ID = "M1-C-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M1-C-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M1-C-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M2-A
    #######################################################################

    if [ $MODEL_ID = "M2-A-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M2-A-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M2-B
    #######################################################################

    if [ $MODEL_ID = "M2-B-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M2-B-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M2-B-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M2-C
    #######################################################################

    if [ $MODEL_ID = "M2-C-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M2-C-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M2-C-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/t.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M3-X
    #######################################################################

    if [ $MODEL_ID = "M3-X-XX" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M3-A
    #######################################################################

    if [ $MODEL_ID = "M3-A-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-A-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M3-B
    #######################################################################

    if [ $MODEL_ID = "M3-B-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-B-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-B-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M3-C
    #######################################################################

    if [ $MODEL_ID = "M3-C-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-C-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-C-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M4-X
    #######################################################################

    if [ $MODEL_ID = "M4-X-XX" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M4-A
    #######################################################################

    if [ $MODEL_ID = "M4-A-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M4-A-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M4-B
    #######################################################################

    if [ $MODEL_ID = "M4-B-G1" ]; then
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
    if [ $MODEL_ID = "M4-B-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/f.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/g.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M4-B-G3" ]; then
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

    #######################################################################
    ################################################################## M4-C
    #######################################################################

    if [ $MODEL_ID = "M4-C-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M4-C-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M4-C-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

fi

###########################################################################
##################################################################### SF=10
###########################################################################

if [ $SF = "SF10" ]; then

    #######################################################################
    ################################################################## M1-C
    #######################################################################

    if [ $MODEL_ID = "M1-C-G3" ]; then
        
        7z x /home/mateus/apps/downloader/tmp/SF10/M1/M1-C-G3/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M1/M1-C-G3/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M1/M1-C-G3/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M1/M1-C-G3/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M1/M1-C-G3/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M1/M1-C-G3/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt

    fi

    #######################################################################
    ################################################################## M2-A
    #######################################################################

    if [ $MODEL_ID = "M2-A-G1" ]; then
        
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-7.7z
        python3 $LOADER_PATH t-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-8.7z
        python3 $LOADER_PATH t-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-9.7z
        python3 $LOADER_PATH t-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-9.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-10.7z
        python3 $LOADER_PATH t-10.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-10.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G1/t-11.7z
        python3 $LOADER_PATH t-11.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-11.txt

    fi

    if [ $MODEL_ID = "M2-A-G3" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-A-G3/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt
    fi

    #######################################################################
    ################################################################## M2-B
    #######################################################################

    if [ $MODEL_ID = "M2-B-G1" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G1/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt
    fi

    if [ $MODEL_ID = "M2-B-G2" ]; then
        
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-0.7z
        #python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf t-0.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-1.7z
        #python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-1.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-2.7z
        #python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-2.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-3.7z
        #python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-3.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-4.7z
        #python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-4.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-5.7z
        #python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-5.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-6.7z
        #python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-6.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-7.7z
        #python3 $LOADER_PATH t-7.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-7.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-8.7z
        #python3 $LOADER_PATH t-8.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-8.txt
        #7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-9.7z
        #python3 $LOADER_PATH t-9.txt $LOAD_TIMES_FILEPATH 0
        #rm -rf t-9.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-10.7z
        python3 $LOADER_PATH t-10.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-10.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G2/t-11.7z
        python3 $LOADER_PATH t-11.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-11.txt

    fi

    if [ $MODEL_ID = "M2-B-G3" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-B-G3/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt
    fi

    #######################################################################
    ################################################################## M2-C
    #######################################################################

    if [ $MODEL_ID = "M2-C-G1" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G1/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt
    fi

    if [ $MODEL_ID = "M2-C-G2" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G2/t-7.7z
        python3 $LOADER_PATH t-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-7.txt
    fi

    if [ $MODEL_ID = "M2-C-G3" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-0.7z
        python3 $LOADER_PATH t-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf t-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-1.7z
        python3 $LOADER_PATH t-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-2.7z
        python3 $LOADER_PATH t-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-3.7z
        python3 $LOADER_PATH t-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-4.7z
        python3 $LOADER_PATH t-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-5.7z
        python3 $LOADER_PATH t-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M2/M2-C-G3/t-6.7z
        python3 $LOADER_PATH t-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf t-6.txt
    fi

    #######################################################################
    ################################################################## M3-X
    #######################################################################

    if [ $MODEL_ID = "M3-X-XX" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M3-A
    #######################################################################

    if [ $MODEL_ID = "M3-A-G1" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-0.7z
        python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf b-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-1.7z
        python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-2.7z
        python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-3.7z
        python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-4.7z
        python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-5.7z
        python3 $LOADER_PATH b-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-6.7z
        python3 $LOADER_PATH b-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-7.7z
        python3 $LOADER_PATH b-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-8.7z
        python3 $LOADER_PATH b-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-9.7z
        python3 $LOADER_PATH b-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-9.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G1/b-10.7z
        python3 $LOADER_PATH b-10.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-10.txt
    fi

    if [ $MODEL_ID = "M3-A-G3" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G3/b-0.7z
        python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf b-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G3/b-1.7z
        python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G3/b-2.7z
        python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G3/b-3.7z
        python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-A-G3/b-4.7z
        python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-4.txt
    fi

    #######################################################################
    ################################################################## M3-B
    #######################################################################

    if [ $MODEL_ID = "M3-B-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "M3-B-G2" ]; then
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-0.7z
        python3 $LOADER_PATH b-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf b-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-1.7z
        python3 $LOADER_PATH b-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-2.7z
        python3 $LOADER_PATH b-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-3.7z
        python3 $LOADER_PATH b-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-4.7z
        python3 $LOADER_PATH b-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-5.7z
        python3 $LOADER_PATH b-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-6.7z
        python3 $LOADER_PATH b-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-7.7z
        python3 $LOADER_PATH b-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-8.7z
        python3 $LOADER_PATH b-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-9.7z
        python3 $LOADER_PATH b-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-9.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M3/M3-B-G2/b-10.7z
        python3 $LOADER_PATH b-10.txt $LOAD_TIMES_FILEPATH 0
        rm -rf b-10.txt
    fi

    if [ $MODEL_ID = "M3-B-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M3-C
    #######################################################################

    if [ $MODEL_ID = "M3-C-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-C-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi
    if [ $MODEL_ID = "M3-C-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M4-X
    #######################################################################

    if [ $MODEL_ID = "M4-X-XX" ]; then
        python3 $LOADER_PATH $BASE_PATH/a.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M4-A
    #######################################################################

    if [ $MODEL_ID = "M4-A-G1" ]; then

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/b.7z
        python3 $LOADER_PATH b.txt $LOAD_TIMES_FILEPATH 1
        rm -rf b.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-0.7z
        python3 $LOADER_PATH c-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf c-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-1.7z
        python3 $LOADER_PATH c-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-2.7z
        python3 $LOADER_PATH c-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-3.7z
        python3 $LOADER_PATH c-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-4.7z
        python3 $LOADER_PATH c-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-5.7z
        python3 $LOADER_PATH c-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-6.7z
        python3 $LOADER_PATH c-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-7.7z
        python3 $LOADER_PATH c-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-8.7z
        python3 $LOADER_PATH c-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/c-9.7z
        python3 $LOADER_PATH c-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf c-9.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/d.7z
        python3 $LOADER_PATH d.txt $LOAD_TIMES_FILEPATH 1
        rm -rf d.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-A-G1/e.7z
        python3 $LOADER_PATH e.txt $LOAD_TIMES_FILEPATH 1
        rm -rf e.txt

    fi
    if [ $MODEL_ID = "M4-A-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    #######################################################################
    ################################################################## M4-B
    #######################################################################

    if [ $MODEL_ID = "M4-B-G1" ]; then
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

    if [ $MODEL_ID = "M4-B-G2" ]; then

        #7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/b.7z
        #python3 $LOADER_PATH b.txt $LOAD_TIMES_FILEPATH 1
        #rm -rf b.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/c.7z
        python3 $LOADER_PATH c.txt $LOAD_TIMES_FILEPATH 1
        rm -rf c.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/d.7z
        python3 $LOADER_PATH d.txt $LOAD_TIMES_FILEPATH 1
        rm -rf d.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/e.7z
        python3 $LOADER_PATH e.txt $LOAD_TIMES_FILEPATH 1
        rm -rf e.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-0.7z
        python3 $LOADER_PATH f-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf f-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-1.7z
        python3 $LOADER_PATH f-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-2.7z
        python3 $LOADER_PATH f-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-3.7z
        python3 $LOADER_PATH f-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-3.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-4.7z
        python3 $LOADER_PATH f-4.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-4.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-5.7z
        python3 $LOADER_PATH f-5.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-5.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-6.7z
        python3 $LOADER_PATH f-6.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-6.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-7.7z
        python3 $LOADER_PATH f-7.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-7.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-8.7z
        python3 $LOADER_PATH f-8.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-8.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/f-9.7z
        python3 $LOADER_PATH f-9.txt $LOAD_TIMES_FILEPATH 0
        rm -rf f-9.txt

        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/g-0.7z
        python3 $LOADER_PATH g-0.txt $LOAD_TIMES_FILEPATH 1
        rm -rf g-0.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/g-1.7z
        python3 $LOADER_PATH g-1.txt $LOAD_TIMES_FILEPATH 0
        rm -rf g-1.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/g-2.7z
        python3 $LOADER_PATH g-2.txt $LOAD_TIMES_FILEPATH 0
        rm -rf g-2.txt
        7z x /home/mateus/apps/downloader/tmp/SF10/M4/M4-B-G2/g-3.7z
        python3 $LOADER_PATH g-3.txt $LOAD_TIMES_FILEPATH 0
        rm -rf g-3.txt

    fi

    if [ $MODEL_ID = "M4-B-G3" ]; then
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

    #######################################################################
    ################################################################## M4-C
    #######################################################################

    if [ $MODEL_ID = "M4-C-G1" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "M4-C-G2" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
    fi

    if [ $MODEL_ID = "M4-C-G3" ]; then
        python3 $LOADER_PATH $BASE_PATH/b.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/c.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/d.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/e.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/h.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/i.txt $LOAD_TIMES_FILEPATH 1
        python3 $LOADER_PATH $BASE_PATH/j.txt $LOAD_TIMES_FILEPATH 1
    fi

fi
