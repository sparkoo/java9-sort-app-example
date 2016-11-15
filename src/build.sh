#!/usr/bin/env bash

#set -x
set -e

export JAVA_HOME=/home/mvala/sw/jdk9
export PATH=$PATH:${JAVA_HOME}/bin

BIN_DIR=mbin
LIB_DIR=mlib
SRC_DIR=src
EXEC_DIR=${BIN_DIR}/jre

printf "clean .......... "
rm -rf ${BIN_DIR} && mkdir ${BIN_DIR}
rm -rf ${LIB_DIR} && mkdir ${LIB_DIR}
printf "done\n"

printf "build .......... "
if
    javac -d ${BIN_DIR} \
        --module-source-path $SRC_DIR \
        $( find ${SRC_DIR} -name '*.java' )
then
    printf "done\n"
else
    printf "fail\n"
fi

#printf "\n"
#printf " built classes\n"
#printf " =============\n"
#find $BIN_DIR -type f


printf "packing ........ "
for module in ${SRC_DIR}/*; do
    if [ -d "${module}" ]; then
        module=$(basename "$module")
        jar --create --file=${LIB_DIR}/${module}.jar --module-version=1.0 -C ${BIN_DIR}/${module} .
    fi
done
printf "done\n"


printf "linking ........ "
jlink --module-path ${JAVA_HOME}/jmods:${BIN_DIR} --add-modules j9test.app --output ${EXEC_DIR}
printf "done\n"


printf "running ........ \n"
${EXEC_DIR}/bin/java -p mlib -m j9test.app/cz.sparko.j9test.app.App
printf "................ done\n"