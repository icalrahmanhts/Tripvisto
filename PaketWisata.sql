CREATE DATABASE Tripvisto_Database

CREATE TABLE MsProduct
(
	ProductID CHAR (5) PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL,
	Itinerary VARCHAR(100) NOT NULL
)

CREATE TABLE MsOrder
(
	OrderID CHAR(5) PRIMARY KEY,
	OrderDate Date NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES MsProduct
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT cek1 CHECK(OrderID LIKE 'OD[0-9][0-9][0-9]')
	
)

CREATE TABLE D2NPackage
(
	SchemaID CHAR(5) PRIMARY KEY,
	SchemaName VARCHAR(50) NOT NULL,
	PilihanHotel CHAR(5) NOT NULL,
	NamaPilihan VARCHAR(50) NOT NULL,
	IDPax CHAR(5) NOT NULL,
	JumlahPax VARCHAR(50) NOT NULL,
	HargaPax VARCHAR(20) NOT NULL,
	IDSupplement CHAR(5) NOT NULL,
	SingleSupplement VARCHAR(50) NOT NULL,
)

CREATE TABLE DivingPackage
(
	SchemaID CHAR(5) PRIMARY KEY,
	SchemaName VARCHAR(50) NOT NULL,
	PaketID CHAR(5) NOT NULL,
	NamaPaket VARCHAR(50) NOT NULL,
	HargaPaket VARCHAR(50) NOT NULL,
)

--INSERT
INSERT INTO MsProduct VALUES('PD001','3D2NPackage','Day 1: Jemput Bandara, Day 2: Keliling Bali, Day 3: Anter ke Bandara dan Pulang')
INSERT INTO MsProduct VALUES('PD002','DivingInBali','Bertemu dengan instruktur di site')

INSERT INTO MsOrder VALUES('OD001',25,'PD001')
INSERT INTO MsOrder VALUES('OD002', 2, 'PD002')

INSERT INTO D2NPackage VALUES('SD001','Skema Harga Supplier','BT001','Bintang 3','PX001','2-4pax', 1500000, 'SP001',500000)
INSERT INTO D2NPackage VALUES('SD001','Skema Harga Supplier','BT001','Bintang 3','PX002','5-8pax', 1450000,'SP001',500000)
INSERT INTO D2NPackage VALUES('SD001','Skema Harga Supplier','BT001','Bintang 3','PX003','9-10pax', 1400000, 'SP001',500000)
INSERT INTO D2NPackage VALUES('SD001','Skema Harga Supplier','BT002','Bintang 4','PX004','2-6pax', 2000000, 'SP002',600000)
INSERT INTO D2NPackage VALUES('SD001','Skema Harga Supplier','BT002','Bintang 4','PX005','7-10pax', 1900000, 'SP002',600000)
INSERT INTO D2NPackage VALUES('SD002','Skema Harga Penjualan','BT001','Bintang 3','PX001','2-4pax', 1600000, 'SP001',550000)
INSERT INTO D2NPackage VALUES('SD002','Skema Harga Penjualan','BT001','Bintang 3','PX002','5-8pax', 1550000,'SP001',550000)
INSERT INTO D2NPackage VALUES('SD002','Skema Harga Supplier','BT001','Bintang 3','PX003','9-10pax', 1500000, 'SP001',500000)
INSERT INTO D2NPackage VALUES('SD002','Skema Harga Supplier','BT002','Bintang 4','PX004','2-6pax', 2100000, 'SP002',700000)
INSERT INTO D2NPackage VALUES('SD002','Skema Harga Supplier','BT002','Bintang 4','PX005','7-10pax', 2000000, 'SP002',700000)

INSERT INTO DivingPackage VALUES('SD001','Skema Harga Supplier','PK001','Paket A',1000000)
INSERT INTO DivingPackage VALUES('SD001','Skema Harga Supplier','PK002','Paket B',1500000)
INSERT INTO DivingPackage VALUES('SD001','Skema Harga Supplier','PK003','Paket C',1750000)
INSERT INTO DivingPackage VALUES('SD002','Skema Harga Penjualan','PK001','Paket A',1100000)
INSERT INTO DivingPackage VALUES('SD002','Skema Harga Penjualan','PK002','Paket B',1600000)
INSERT INTO DivingPackage VALUES('SD002','Skema Harga Penjualan','PK003','Paket C',1850000)

--SELECT
SELECT * FROM MsProduct
SELECT * FROM MsOrder
SELECT * FROM D2NPackage
SELECT * FROM DivingPackage

SELECT HargaPax + 'Rp.' + CAST(CAST(HargaPax* 1.1 as int)as VARCHAR) 
From D2NPackage
WHERE CAST(HargaPax* 1.1 as int) %10000=0
