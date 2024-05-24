createDirList=(\
"build/out" \
"build/Taromati2/shell" \
"build/Taromati2/ghost/master" \
)
cpBaseFileList=(\
"Taromati2/install.txt" \
"Taromati2/terms.txt" \
"Taromati2/shell/master" \
"Taromati2/ghost/master/dic" \
"Taromati2/ghost/master/descript.txt" \
"Taromati2/ghost/master/thumbnail.png" \
"Taromati2/ghost/master/readme.txt" \
"Taromati2/ghost/master/shiori/aya.dll" \
"Taromati2/ghost/master/shiori/aya*.txt" \
"Taromati2/ghost/master/sound" \
"Taromati2/ghost/master/saori/*.dll" \
"Taromati2/ghost/master/saori/*.bat" \
"Taromati2/ghost/master/saori/*.base" \
"Taromati2/ghost/master/saori/*.exe" \
"Taromati2/ghost/master/saori/Speech_Recognition/*.dll" \
"Taromati2/ghost/master/saori/Speech_Recognition/*.vbs" \
"Taromati2/ghost/master/saori/AnalogClock2_0/*.png" \
"Taromati2/ghost/master/saori/AnalogClock2_0/clock.txt" \
"Taromati2/ghost/master/saori/AnalogClock2_0/*.dll" \
"Taromati2/ghost/master/pseudoAI/*.ai" \
"Taromati2/ghost/master/pseudoAI/*.base" \
)
cpFullFileList=(\
"Taromati2/ghost/master/data" \
"Taromati2/ghost/master/img" \
)
rm -rf build
# base
for i in ${!createDirList[@]}; do
echo "mkdir ${createDirList[$i]}"
mkdir -p ${createDirList[$i]}
done
rsync -av "Taromati2/balloon/wiz/" "build/Taromati2/wiz/"
for i in ${!cpBaseFileList[@]}; do
rsync -av ${cpBaseFileList[$i]} "$(dirname "build/${cpBaseFileList[$i]}")/"
done
rsync -av "Taromati2/.nar_icon/" "build/.nar_icon/"
cd "build"
7z a -tzip "Taromati2_base.nar" -mx=9 -mmt -mtc=off "Taromati2" ".nar_icon"
mv "Taromati2_base.nar" "out"

# full
cd ".."
for i in ${!cpFullFileList[@]}; do
rsync -av ${cpFullFileList[$i]} "$(dirname "build/${cpFullFileList[$i]}")/"
done
find "Taromati2/shell" -type d -name "[!.]*" -exec cp -rv {} "build/Taromati2/shell" \;
rm -rf "build/Taromati2/shell/Entire bare"
cd "build"
7z a -tzip "Taromati2_full.nar" -mx=9 -mmt -mtc=off "Taromati2" ".nar_icon"
mv "Taromati2_full.nar" "out"
echo "build end~"
