#!/bin/sh

scm=`git log -n 1 --pretty=format:"PROJECT_NUMBER=\"%s / %h / %ai\""`
if [ $? -ne 0 ]
then
	scm='PROJECT_NUMBER='
fi

inp="INPUT+=../../src" #EDIT IT
pname="PROJECT_NAME=\"EXAMPLE\"" #EDIT IT
brief="PROJECT_BRIEF=\"EXAMPLE\"" #EDIT IT
outdir="OUTPUT_DIRECTORY=./EXAMPLE" #EDIT IT
(cat DoxyfileTemplate ; echo $brief ; echo $pname ; echo $inp ; echo $outdir ; echo $scm) | doxygen -
