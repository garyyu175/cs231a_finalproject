#!/bin/bash

OBJ="face"

function simplify () {
   IN="face_png/$1"
   OUT="face_out/$1"
   python simplify.py --img "$IN" --out "$OUT" || exit 1
}
function convert () {
   IN="face_out/${1}.png"
   OUT_SVG="face_svg/${1}.svg"
   OUT_PDF="face_pdf/$1"
   
   echo -e "\n$IN"
   echo -e "\n$OUT_SVG"
   
   convert "$IN" bmp:- | mkbitmap - -t 0.3 -o - | potrace --svg -t 15 -o - > "$OUT_SVG" || exit 1
   #convert "$IN" bmp:- | mkbitmap - -t 0.3 -o - | potrace --postscript --cleartext --longcoding -t 15 -o - > "$OUT_PS"
   # convert face_1.png bmp:- | mkbitmap - -t 0.3 -o - | potrace --svg -t 15 -o - > face_1.svg
   # convert face_1.png bmp:- | mkbitmap - -t 0.3 -o - | potrace --postscript --cleartext --longcoding -t 15 -o - > face_1.ps
   
   # convert face_out/face_1.png bmp:- | mkbitmap - -t 0.3 -o - | potrace --svg -t 15 -o - > face_svg/face_1.svg
}

INPUTS=(
   "face_1.png"
   "face_2.png"
   "face_3.png"
)

test -d face_out/ || mkdir -p face_out/
test -d face_svg/ || mkdir -p face_svg/
for FILE in "${INPUTS[@]}"; do
   echo -e "\nProcessing ${FILE}..."
   FILE_NAME="${FILE%%.*}"
   echo -e "\n$FILE_NAME"
   
   # simplify "$FILE"
   
   convert "$FILE_NAME"
   
   echo -e "\nDone!"
done



