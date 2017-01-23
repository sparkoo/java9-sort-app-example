#!/usr/bin/env bash

printf "compile ........ "
if
    ${JAVAC} -d ${OUT_DIR} \
        --module-source-path ${SRC_DIR} \
        $( find ${SRC_DIR} -name '*.java' )
then
    printf "done\n"
else
    printf "fail\n"
    exit 1
fi