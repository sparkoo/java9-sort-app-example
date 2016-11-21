#!/usr/bin/env bash

#set -x
set -e

cd ~/dev/java9-sort-app-example

export JAVA_HOME=/home/mvala/sw/jdk9
export PATH=$PATH:${JAVA_HOME}/bin

OUT_DIR=mout
LIB_DIR=mlib
SRC_DIR=src
EXEC_DIR=${LIB_DIR}/jre


printf "clean .......... "
rm -rf ${OUT_DIR} && mkdir ${OUT_DIR}
rm -rf ${LIB_DIR} && mkdir ${LIB_DIR}
printf "done\n"


printf "build .......... "
if
    javac -d ${OUT_DIR} \
        --module-source-path $SRC_DIR \
        $( find ${SRC_DIR} -name '*.java' )
then
    printf "done\n"
else
    printf "fail\n"
    exit 1
fi


#printf "\n"
#printf " built classes\n"
#printf " =============\n"
#find $BIN_DIR -type f


printf "packing jar .... "
for module in ${SRC_DIR}/*; do
    if [ -d "${module}" ]; then
        module=$(basename "$module")
        jar --create --file=${LIB_DIR}/${module}.jar -C ${OUT_DIR}/${module} .
    fi
done
jar --create --file=${LIB_DIR}/app.jar --main-class cz.sparko.j9.sortapp.app.Main -C ${OUT_DIR}/app .
printf "done\n"


#printf "packing jmod ... "
#for module in ${SRC_DIR}/*; do
#    if [ -d "${module}" ]; then
#        module=$(basename "$module")
#        jmod create \
#            --module-path ${OUT_DIR}/${module} \
#            --class-path ${OUT_DIR}/${module} \
#            ${LIB_DIR}/${module}.jmod
#    fi
#done
#rm ${LIB_DIR}/app.jmod
#jmod create \
#    --module-path ${OUT_DIR}/app \
#    --class-path ${OUT_DIR}/app \
#    --main-class cz.sparko.j9.sortapp.app.Main \
#    ${LIB_DIR}/app.jmod
#printf "done\n"


printf "linking ........ "
jlink --module-path ${JAVA_HOME}/jmods:${LIB_DIR} \
    --add-modules app \
    --add-modules sort.bubble,sort.selection,sort.insertion \
    --output ${EXEC_DIR}
printf "done\n"


printf "running ........ \n\n"
#${EXEC_DIR}/bin/app
java --module-path ${LIB_DIR} -m app/cz.sparko.j9.sortapp.app.Main
#${EXEC_DIR}/bin/java --module-path mlib/sort.selection.jar --module app/cz.sparko.j9.sortapp.app.Main
printf "\n................ done\n"


#/home/mvala/sw/jdk9/bin/jlink \
#    --module-path /home/mvala/sw/jdk9-cross/jdk9-win/jmods:mlib \
#    --add-modules app \
#    --add-modules sort.bubble,sort.insertion,sort.selection \
#    --output mlib/jre-win


rm -rf ${OUT_DIR}