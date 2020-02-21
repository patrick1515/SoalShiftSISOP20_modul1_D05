#!/bin/bash
echo "soal 1a"
 
awk -F "\t" '{x[$13] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2 | head -1
 
 
echo "soal 1b"
awk -F "\t" '/Central/{x[$11] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2
 
echo "soal 1c"
 
awk -F "\t" '{if($11="Texas"||$11="Illinois")}/Central/ {x[$17] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -10
