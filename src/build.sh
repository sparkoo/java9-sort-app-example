#!/usr/bin/env bash

#set -x
set -e

source src/setEnv.sh

${JAVA} -version

pushd ${PROJECT_PATH}

source src/compile.sh
source src/package.sh
source src/link.sh
source src/run.sh

popd
