# Tripvisto
Programming Test Tripvisto

Saya membuat rancangan dataabase SQL dengan Table MsOrder, MsProduct, D2NPackage, dan DivingPackage.
Table MsOrder untuk membagi order ke dalam 1 field tertentu, berdasarkan tanggal dan pilihan product yang akan diambil. 
Table MsProduct untuk memisahkan Transaksi untuk paket 3D2N, dan paket yang Diving di Bali 1 hari. 
Table D2NPackage berfokus pada rincian harga per pax (Supplier dan Penjualan) untuk paket 3D2N berdasarkan pilihan hotel (Bintang 3 maupun Bintang 4).
Table DivingPackage berfokus pada rincian harga per pax (Supplier dan Penjualan) untuk paket Diving di Bali selama 1 hari berdasarkan pilihan Paket A, B, maupun Paket C.

Terkait relasi antar tabel, pada case ini yang bertindak sebagai master adalah MsOProduct, D2NPackage, dan DivingPackage. Sedangkan MsOrder termasuk sebagai transaction dimana ada record untuk setiap hari sesuai dengan pilihan/order dari pelanggan (Paket 3hari2malam, atau Diving 1 hari di Bali). 

Untuk Table D2NPackage dan DivingPackage memiliki relasi dengan Table MsProduct, dimana ID Product dan Nama Product menentukan apakah produk yang dipilih adalah produk paket 3hari2malam atau paket diving selama 1 hari. Dengan kata lain, pada tabel 2DNpackage mempunyai FOREIGN KEY IDProduct dimana references pada table MsProduct. Hal yang sama juga berlaku pada tabel DivingPackage yang mendapatkan FOREIGN KEY IDProduct dari tabel MsProduct. 

Mengenai handling case, saya akan sedikit menjabarkan logika pengerjaannya. 
Paket tour Bali 3 Hari 2 Malam pada tanggal 25,26, 31 Desember 2015 naik harganya sebesar 10%
Dalam Database mungkin dapat dibuat sebagai berikut: 
Kita harus menggabungkan Table MsProduct, MsOrder dan D2NPackage menjadi satu table.
SELECT p.ProductID, p.ProductName, r.OrderDate, d.SchemaID, d.SchemaName, d.IDPax, d.JumlahPax, d.HargaPax, d.SingleSupplement
FROM MsProduct p, MsOrder r, D2NPackage d
ON p.ProductID = r.OrderID, p.ProductID = d.ProductID
Lalu kita lakukan perubahan data berdasarkan handling case seperti diatas
UPDATE  d.HargaPax SET d.HargaPax * 10% 
FROM D2NPackage
WHERE d.SchemaID='SD002' AND r.OrderDate= 25, 26, 31

Apabila pelanggan mau order Paket 3D2N selain tanggal 25, 26, dan 31 Desember;
SELECT * FROM D2NPackage

Untuk handling case Markup lebih dari 100, mohon maaf saya belum mengerti konsep realisasinya seperti apa. 
