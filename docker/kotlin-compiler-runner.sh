#!/bin/bash
# Can be invoked as:
#       xxx.sh main.kt

#echo "TECHIO> terminal"

source_file=$1

KOTLINC_LIB_DIR="/opt/kotlinc/lib"
classpath=.:${KOTLINC_LIB_DIR}/kotlin-stdlib-jre8.jar:${KOTLINC_LIB_DIR}/kotlin-stdlib-jre7.jar:${KOTLINC_LIB_DIR}/kotlin-stdlib.jar:${KOTLINC_LIB_DIR}/annotations-13.0.jar

# Compile
/opt/techio/k2/K2JVMCompiler org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -jdk-home /docker-java-home -cp $classpath $1
compilationExitCode=$?

if [ $compilationExitCode -eq 0 ]; then
    nokt="${source_file%.*}"
    withupper="${nokt^}"
    classname=${withupper}Kt
    java -cp $classpath ${classname}
else
    exit $compilationExitCode
fi
