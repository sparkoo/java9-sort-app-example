#!/usr/bin/env bash

printf "running java ........ \n\n"
${JAVA} --module-path ${LIB_DIR} -m app/cz.sparko.j9.sortapp.app.Main
printf "\n................ done\n"

printf "running link/app .... \n\n"
${EXEC_DIR}/bin/app
printf "\n................ done\n"

printf "running link/java ... \n\n"
${EXEC_DIR}/bin/java --module-path ${LIB_DIR}/sort.selection.jar --module app/cz.sparko.j9.sortapp.app.Main
printf "\n................ done\n"