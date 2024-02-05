#!/usr/bin/bash
rm -rf mod
mkdir mod
cp *.asm mod/
cp jclass.inc mod/jclass.inc
cp bytecode.inc mod/bytecode.inc
cp -r sprites/ mod/sprites/
cp -r bundles/ mod/bundles/
cp -r sprites-override/ mod/sprites-override/
cd mod
for i in *.asm
do
    if test -f "$i"
    then
       echo  "file $i :"
       fasm "$i"
       rm "$i"
    fi
done
rm jclass.inc
rm bytecode.inc
cd ..
cp mod.json mod/
cd mod
ls .|grep ".class">list.txt
d8 *.class --main-dex-list list.txt
rm list.txt
echo "zipping it into the jar"
zip -r mod.jar *
rm *.class
rm mod.json
rm classes.dex
rm -r */
cd ..
