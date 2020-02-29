#3a
#!/bin/bash

for ((i=1; i<=28;i++))
do
        wget -O pdkt_kusuma_$i.jpg https://loremflickr.com/320/240/cat -a wget.log
done

#3b
5 6-23/8 * * 1-5,7 soal3.sh

#pembuatan folder kenangan dan duplicate
mkdir kenangan
mkdir duplicate

#3c
#!/bin/bash

grep "Location" wget.log > location.log
readarray arr < location.log

for i in {1..28}
do
        for j in {1..28}
        do
                if [ $i == $j ]
                then
                        continue
                elif [ "${arr[$i]}" = "${arr[$j]}" ]
                then
                        mv pdkt_kusuma_$i.jpg ./duplicate/duplicate_$i.jpg
                fi
        done
done
for i in {1..28}
do
        mv pdkt_kusuma_$i.jpg ./kenangan/kenangan_$i.jpg
done
cp wget.log wget.log.bak
