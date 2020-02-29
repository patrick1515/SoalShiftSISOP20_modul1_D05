# SoalShiftSISOP20_modul1_D05
## Kelompok B02
* 05111840000085 - Imanuel Banifernando Simatupang 
* 05111840000098 - Patrick Cipta Winata
### 1. Soal Nomor 1 
```bash
#!/bin/bash

echo "soal 1a"
 
awk -F "\t" '{x[$13] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2 | head -1
  
echo "soal 1b"
awk -F "\t" '/Central/{x[$11] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2
 
echo "soal 1c"
 
awk -F"\t"  '$11 ~ /Texas/ || $11 ~ /Illinois/  {x[$17] += $21} END {for (a in x)  print x[a],a}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -g | head -10
```
### Penjelasan
- 1.a
Dimana pada soal diminta menggunakan awk dan disitu untuk bisa dibaca perbarisnya menggunakan -F "\t"
dan dibisa per tabnya lalu $13 dan $21 adalah untuk menggunakn tabel ke 13 dan 21 yaitu tabel region dan profit dan juga setelah diurutkan dan dijumlahkan menggunakan fungsi tersebut lalu file dipanggil dari tempat posisi file dan karena diminta dua tersedikit maka digunakan sort yang saya urutkan dari tertinggi pertama lalu ke terendah dan diambil nilai terbawah.

```awk -F "\t"```  berfungsi sebagai separator dan ini akan megubahnya menjadi tab dan data akan dibaca perbaris
```'{x[$13] += $21}END{for (a in x) {print x[a], a}}'```  dimana terdapat sebuah array idman indeksnya berada di baris ke 13 dan nilainya di baris ke 21 dan disana akan dilakukan perulangan dimana perulangan itu dilakukan bertujuan unutk menjumlah niali nay sesuai daat yang ada di region
```/home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2 | head -1``` ini bertujuan unutk memanggil tempat data tersebut disimpan datang bertujuan untuk mengerutkan dari bawah keatas lalu diambil yang teratas

![no1a](https://user-images.githubusercontent.com/61314890/75606535-4f8dde00-5b20-11ea-85db-54ffc46b9cf9.png)

- 1.b 
Untuk penjelasn satu b sama saperti 1a untuk formatnya yang membedakan bahwa fungsi yang dipanggil itu baris ke 11 yaitu state dan kerena hasil dari no1a adalah central maka itu diambil hanya central saja
untuk soal b nya soal ini hanya berbeda di fungsi :
```awk -F "\t"```  berfungsi sebagai separator dan ini akan mengubahnya menjadi tab dan data akan dibaca perbaris
```'{x[$11] += $21}END{for (a in x) {print x[a], a}}'```  dimana terdapat sebuah array dimana indeksnya berada di baris ke 11 dan nilanya di baris ke 21 dan disana akan dilakukan perulangan dimana perulangan itu dilakukan bertujuan untuk menjumlah niali nay sesuai daat yang ada di region
```/Central/ ``` dimana bertujuan unutk memanggil dat =a nilai region sentral saja dan yang lain tidak dianggap
```/home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2 | head -1``` ini bertujuan unutk memanggil tempat data tersebut disimpan datang bertujuan untuk mengerutkan dari bawah keatas lalu diambil yang teratas

![1b](https://user-images.githubusercontent.com/61314890/75606544-6af8e900-5b20-11ea-9594-f6b5e81813ed.png)


- 1.c ```awk -F"\t"  '$11 ~ /Texas/ || $11 ~ /Illinois/  {x[$17] += $21} END {for (a in x)  print x[a],a}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -g | head -10```

Sama seperti 1a dan 1b dimana fungsi itu yang membedakan adaalh bahwa fungsi yang dipanngil ada di baris ke 17 yaitu product name yang berdasarkan jawaban 1.b yaitu texas dan illinois juga berdasarkan 1a yaitu central
untuk soal b nya soall ini hanya berbeda di fungsi :
```awk -F "\t" ``` berfungsi sebagai separator dan ini akan megubahnya menjadi tab dan data akan dibaca perbaris
```'$11 ~ /Texas/ || $11 ~ /Illinois/ ```dimana ini bertujuan unutk memanggil data dimana nilai yang diaambil hanya berdasarkan state texas dan illinois
```{x[$17] += $21}``` dimana terdapat sebuah array yang indexnya berada di baris ke 17 dan nilanya di baris ke 

### Kendala

### 2. Soal No 2
```bash
#2a & 2b

#!/bin/bash
if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
        low=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
        up=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
        num=(0 1 2 3 4 5 6 7 8 9)
        char=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)       
        for ((i = 1; i <= 7 ; i++)) do
                rand=$[$RANDOM%${#char[@]}]
                rand1=$[$RANDOM%${#low[@]}]
                rand2=$[$RANDOM%${#up[@]}]
                rand3=$[$RANDOM%${#num[@]}]
                password="${password}${char[$rand]}"
                password="${password}${low[$rand1]}"
                password="${password}${up[$rand2]}"
                password="${password}${num[$rand3]}"
        done
        echo $password>$1.txt
else
        echo "Error"
fi

#2c

#!/bin/bash

now=$(stat -c %y $1 | grep -oP '(?<=[^ ] ).*(?=:.*:)')
low=(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)
up=(ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ)
x=$(echo $1|grep -oP  '.*(?=\.txt)')
namabaru=$(echo $x|tr ${low:0:26}${up:0:26} ${low:$now:26}${up:$now:26})
mv $1 $namabaru".txt"

#2d

#!/bin/bash

low=(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)
up=(ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ)

now=$(stat -c %y $1 | grep -oP '(?<=[^ ] ).*(?=:.*:)')
back=$(echo "${1%.txt}" | tr ${low:$now:26}${up:$now:26} ${low:0:26}${up:0:26})
mv $1 $back".txt"

```
### Penjelasan
- 2.a & b 
Generating password menggunakan perulangan array of char sehingga bisa membentuk password sepanjang 28 character dengan syarat minimal 1 angka, 1 huruf besar, 1 huruf kecil. Lalu hasil password dimasukkan kedalam file txt yang dibentuk dengan menggunakan argumen pada saat menjalankan program. Nama file harus dalam bentuk huruf kecil atau huruf besar saja sehingga jika muncul angka akan keluar error. Caranya menggunakan if statement agar program hanya berjalan jika nama file yang dimasukkan hanya alphabets saja.
  - ```if [[ $1 =~ ^[a-zA-Z]+$ ]]``` Untuk cek apakah argumen nama file yang ingin dibuat mengandung huruf kecil atau huruf besar saja.
  - ```rand=$[$RANDOM%${#char[@]}]``` untuk randomize isi char yang akan dikeluarkan. Disini menggunakan 3 random karakter lagi karena untuk memenuhi syarat harus ada minimal 1 huruf kecil, 1 huruf besar, dan 1 angka.  
  - ```echo $password> $1.txt``` untuk memasukkan password ke file txt yang dibuat
- 2.c 
Mengenkripsi file.txt yang dibuat sebelumnya dengan berdasarkan jam pembuatan. Menggunakan fungsi grep untuk menghilangkan .txt dari argumen awal yang dimasukkan agar nama file bisa diganti tanpa mengganti .txt nya. Hal ini mengharuskan kita declare variabel jam agar bisa dijadikan parameter pengubahan nama file berdasarkan jam pembuatan.
  - ```grep -oP  '.*(?=\.txt)')``` untuk exclude .txt 
  - ```namabaru=$(echo $x|tr ${low:0:26}${up:0:26} ${low:$jam:26}${up:$jam:26})``` untuk conversion dari nama lama ke nama baru berdasarkan jam pembuatan
- 2.d 
Mendekripsi file yang sudah dienkrip dengan cara cek perubahan yang sudah terjadi pada nama file. Cek posisi file dan mengembalikannya ke posisi semula
  - ```now=$(stat -c %y $1|grep -oP '(?<=[^ ] ).*(?=:.*:)')``` untuk mengambil jam dari file setelah termodifikasi
  - ```back=$(echo "${1%.txt}"|tr ${low:$now:26}${up:$now:26} ${low:0:26}${up:0:26})``` untuk mengembalikan nama file ke posisi sebelumnya

3. Nomor 3 masih belum selesai karena masih belum memahami penuh cara pengerjaannya menggunakan bash
