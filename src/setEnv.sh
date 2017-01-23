#!/usr/bin/env bash

# project path
PROJECT_PATH=~/dev/java9-sort-app-example
JAVA_HOME=/opt/java/jdk-9

JAVA=${JAVA_HOME}/bin/java
JAVAC=${JAVA_HOME}/bin/javac
JLINK=${JAVA_HOME}/bin/jlink
JAR=${JAVA_HOME}/bin/jar
JAOTC=${JAVA_HOME}/bin/jaotc

if [[ $( uname ) == *NT* ]]; then
    SEP=';'
else
    SEP=':'
fi

OUT_DIR=${PROJECT_PATH}/mout
LIB_DIR=${PROJECT_PATH}/mlib
SRC_DIR=${PROJECT_PATH}/src
EXEC_DIR=${LIB_DIR}/link


printf "clean .......... "
rm -rf ${OUT_DIR} && mkdir ${OUT_DIR}
rm -rf ${LIB_DIR} && mkdir ${LIB_DIR}
printf "done\n"