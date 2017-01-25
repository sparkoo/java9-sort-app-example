#!/usr/bin/env bash

printf "packing jar .... "
for module in ${OUT_DIR}/*; do
    if [ -d "${module}" ]; then
        module=$(basename "$module")
        ${JAR} --create --file=${LIB_DIR}/${module}.jar -C ${OUT_DIR}/${module} .
    fi
done
${JAR} --create --file=${LIB_DIR}/app.jar --main-class cz.sparko.j9.sortapp.app.Main -C ${OUT_DIR}/app .
printf "done\n"