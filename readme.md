1. Soal No 1 
- 1.a ```awk -F "\t" '{x[$13] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2 | head -1```

Dimana pada soal diminta menggunakan awk dan distu unutk bise dibca perbarisnya menggunakan -F "\t"
dan dibisa per tabnya lalu $13 dan $21 adalah untuk menggunakn tabel ke 13 dan 21 yaitu tabel region dan profit danjuga setelah diurutkan dan dijumlahkan menngunkan fungsi tersebut lalu file dipanggil dari tempat posisi file dan karena diminta dua tersedikit makan digunakan sort yang saya urutkan dari tertinggi pertama lalu ke terendah dan diambil nilai terbawah

- 1.b ```awk -F "\t" '/Central/{x[$11] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -2```

untuk penjelasn satu b sam saperti 1a untuk formatnya yang membedakan baahwa fungis yang dipanggil itu baris ke 11 yaitu state dan kerena hasil dari no1a adalah central maka itu diambil hanay central saja

- 1.c ```awk -F "\t" '{if($11="Texas"||$11="Illinois")}/Central/ {x[$17] += $21}END{for (a in x) {print x[a], a}}' /home/imanuel/Downloads/Sample-Superstore.tsv | sort -rg | tail -10```

sama seperti 1a dan 1b dimana fungsi itu yang membedakan adaalh bahwa funsi yang dipanngil ada di baris ke 17 yaitu product name yang berdasrkan jawaban 1.b yaitu texas dan illoris juga berdasarkan 1a yaitu central

2. Soal No 2
- 2.a & b 
Generating password menggunakan perulangan array of char sehingga bisa membentuk password sepanjang 28 character.
  - rand=$[$RANDOM%${#char[@]}] untuk randomize isi char yang akan dikeluarkan
  - echo $password> $1 untuk memasukkan password ke file .txt yang dibuat
- 2.c 
Mengenkripsi file.txt yang dibuat sebelumnya dengan berdasarkan jam pembuatan. Menggunakan fungsi grep untuk menghilangkan .txt dari argumen awal yang dimasukkan agar nama file bisa diganti tanpa mengganti .txt nya. Hal ini mengharuskan kita declare variabel jam agar bisa dijadikan parameter pengubahan nama file berdasarkan jam pembuatan.
  - ```grep -oP  '.*(?=\.txt)')``` untuk exclude .txt 
  - ```namabaru=$(echo $x|tr ${low:0:26}${up:0:26} ${low:$jam:26}${up:$jam:26})``` untuk conversion dari nama lama ke nama baru berdasarkan jam pembuatan
- 2.d 
Mendekripsi file yang sudah dienkrip dengan cara cek perubahan yang sudah terjadi pada nama file. Cek posisi file dan mengembalikannya ke posisi semula
  - ```now=$(stat -c %y $1|grep -oP '(?<=[^ ] ).*(?=:.*:)')``` untuk mengambil jam dari file setelah termodifikasi
  - ```back=$(echo "${1%.txt}"|tr ${low:$now:26}${up:$now:26} ${low:0:26}${up:0:26})``` untuk mengembalikan nama file ke posisi sebelumnya

3. Nomor 3 masih belum selesai karena masih belum memahami penuh cara pengerjaannya menggunakan bash
