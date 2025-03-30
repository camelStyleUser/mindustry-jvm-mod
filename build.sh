#!/bin/bash
cd "`dirname "$0"`"
./clean.sh
mkdir mod
#cp *.asm mod/
cp jclass.inc mod/jclass.inc
cp bytecode.inc mod/bytecode.inc
cp -r sprites/ mod/sprites/
cp -r bundles/ mod/bundles/
cp -r sprites-override/ mod/sprites-override/
cd src
for i in $(find .|grep .asm)
do
    echo "trying to copy $i"
    if test -f "${i}"
    then
       echo  "copying src/${i} to mod/${i}"
       mkdir -p "../mod/`dirname "$i"`"
       cp "${i}" "../mod/${i}"
    fi
done
cd ..
echo "copying completed"
cd mod
for i in $(find|grep .asm)
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
#d8 them all
zip -r mod.jar * #temporary jar for d8
d8 --output . mod.jar
rm mod.jar # remove temporary jar
echo "zipping it into the jar"
zip -r mod.jar *
rm *.class
rm mod.json
rm classes*.dex
rm -r */
cd ..
