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

