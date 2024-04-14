#!/bin/bash
rm -rf mod
mkdir mod
cp *.asm mod/
cp jclass.inc mod/jclass.inc
cp bytecode.inc mod/bytecode.inc
cp -r sprites/ mod/sprites/
cp -r bundles/ mod/bundles/
cp -r sprites-override/ mod/sprites-override/
for i in $(find ./src|grep .asm)
do
    if test -f "$i"
    then
       echo  "copying $i to mod/${i##*/}"
       cp "$i" "mod/${i##*/}"
    fi
done
echo "copying completed"
cd mod
for i in $(ls|grep .asm)
do
echo "building $i :"
fasm "$i"
rm "$i"
done
rm jclass.inc
rm bytecode.inc
cd ..
cp mod.json mod/
cd mod
#get files for d8
ls .|grep ".class">list.txt
#d8 them all
d8 *.class --main-dex-list list.txt
rm list.txt
echo "zipping it into the jar"
zip -r mod.jar *
rm *.class
rm mod.json
rm classes*.dex
rm -r */
cd ..
