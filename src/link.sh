#!/usr/bin/env bash

printf "linking ........ "
# modules sort.'algorithm' can be provided at runtime
${JLINK} --module-path "${JAVA_HOME}/jmods${SEP}${LIB_DIR}" \
    --add-modules app \
    --add-modules sort.bubble,sort.selection,sort.insertion \
    --launcher app=app/cz.sparko.j9.sortapp.app.Main \
    --output ${EXEC_DIR}
printf "done\n"