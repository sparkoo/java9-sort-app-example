#!/usr/bin/env bash

#set -x
set -e

# project path
PROJECT_PATH=~/dev/java9-sort-app-example
JAVA_HOME=/opt/java/jdk-9

JAVA=${JAVA_HOME}/bin/java
JAVAC=${JAVA_HOME}/bin/javac
JLINK=${JAVA_HOME}/bin/jlink
JAR=${JAVA_HOME}/bin/jar
JAOTC=${JAVA_HOME}/bin/jaotc


${JAVA} -version

if [[ $( uname ) == *NT* ]]; then
    SEP=';'
else
    SEP=':'
fi


cd ${PROJECT_PATH}

OUT_DIR=mout
LIB_DIR=mlib
SRC_DIR=src
EXEC_DIR=${LIB_DIR}/link


printf "clean .......... "
rm -rf ${OUT_DIR} && mkdir ${OUT_DIR}
rm -rf ${LIB_DIR} && mkdir ${LIB_DIR}
printf "done\n"


printf "build .......... "
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


#printf "\n"
#printf " built classes\n"
#printf " =============\n"
#find $BIN_DIR -type f


printf "packing jar .... "
for module in ${SRC_DIR}/*; do
    if [ -d "${module}" ]; then
        module=$(basename "$module")
        ${JAR} --create --file=${LIB_DIR}/${module}.jar -C ${OUT_DIR}/${module} .
    fi
done
${JAR} --create --file=${LIB_DIR}/app.jar --main-class cz.sparko.j9.sortapp.app.Main -C ${OUT_DIR}/app .
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
# modules sort.'algorithm' can be provided at runtime
${JLINK} --module-path "${JAVA_HOME}/jmods${SEP}${LIB_DIR}" \
    --add-modules app \
    --add-modules sort.bubble,sort.selection,sort.insertion \
    --output ${EXEC_DIR}
printf "done\n"



printf "running java ........ \n\n"
${JAVA} --module-path ${LIB_DIR} -m app/cz.sparko.j9.sortapp.app.Main
printf "\n................ done\n"

#printf "AOT compiler ........ \n\n"
#${JAOTC} --module-path ${LIB_DIR} ${LIB_DIR}/sort.jar
#printf "\n................ done\n"

#printf "running java with AOT ... \n\n"
#${JAVA} --module-path ${LIB_DIR} -XX:AOTLibrary=./unnamed.so -m app/cz.sparko.j9.sortapp.app.Main
#printf "\n................... done\n"

#printf "running link/app .... \n\n"
#${EXEC_DIR}/bin/app
#printf "\n................ done\n"

printf "running link/java ... \n\n"
${EXEC_DIR}/bin/java --module-path ${LIB_DIR}/sort.selection.jar --module app/cz.sparko.j9.sortapp.app.Main
printf "\n................ done\n"


rm -rf ${OUT_DIR}