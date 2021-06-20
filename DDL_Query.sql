-- Initial DATABASE 
CREATE DATABASE db_inlaundry;

USE db_inlaundry;

-- Create TABLE 
CREATE TABLE Owner(
    id_owner VARCHAR(11) PRIMARY KEY NOT NULL,
    username VARCHAR(11) NOT NULL,
    password VARCHAR(20) NOT NULL
);

CREATE TABLE Employee(
    id_employee VARCHAR(11) PRIMARY KEY NOT NULL,
    username VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    password VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    date_of_birth DATE NOT NULL,
    phone VARCHAR(14) NOT NULL
);

CREATE TABLE Customers(
    id_customers VARCHAR(11) PRIMARY KEY NOT NULL,
    username VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    password VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    date_of_birth DATE NOT NULL,
    phone VARCHAR(14) NOT NULL
);


CREATE TABLE Cuci_Kiloan(
    kode_cuci INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_customers VARCHAR(11) NOT NULL,
    id_employee VARCHAR(11),
    kaos INT(3),
    kemeja INT(3),
    dress INT(3),
    celana_pendek INT(3),
    celana_panjang INT(3)
);

CREATE TABLE Jenis_Layanan(
    id_layanan VARCHAR(11) PRIMARY KEY NOT NULL,
    nama_layanan TEXT NOT NULL,
    harga INT(11) NOT NULL,
    id_owner VARCHAR(11) NOT NULL
);

CREATE TABLE Pemesanan(
    id_order VARCHAR(11) PRIMARY KEY NOT NULL,
    kode_cuci INT(11) NOT NULL,
    id_layanan VARCHAR(11) NOT NULL,
    catatan TEXT,
    alamat TEXT NOT NULL
);

CREATE TABLE Status(
    id_status INT(2) PRIMARY KEY NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE Pembayaran(
    id_pembayaran VARCHAR(11) PRIMARY KEY NOT NULL,
    id_order VARCHAR(11) NOT NULL,
    id_customers VARCHAR(11) NOT NULL,
    id_employee VARCHAR(11),
    id_status INT(2) NOT NULL,
    tanggal_transaksi DATETIME NOT NULL,
    berat INT(3) NOT NULL,
    total INT(11) NOT NULL
);

-- Alter relation between table
ALTER TABLE Jenis_Layanan
ADD CONSTRAINT fk_jenislayanan_owner
FOREIGN KEY (id_owner) REFERENCES Owner(id_owner);

ALTER TABLE Cuci_Kiloan
ADD CONSTRAINT fk_cucikiloan_customers
FOREIGN KEY (id_employee) REFERENCES Employee(id_employee);

ALTER TABLE Cuci_Kiloan
ADD CONSTRAINT fk_cucikiloan_employee
FOREIGN KEY (id_customers) REFERENCES Customers(id_customers);

ALTER TABLE Pemesanan
ADD CONSTRAINT fk_pemesanan_cucikiloan
FOREIGN KEY (kode_cuci) REFERENCES Cuci_Kiloan(kode_cuci);

ALTER TABLE Pemesanan
ADD CONSTRAINT fk_pemesanan_jenislayanan
FOREIGN KEY (id_layanan) REFERENCES Jenis_Layanan(id_layanan);

ALTER TABLE Pembayaran
ADD CONSTRAINT fk_pembayaran_order
FOREIGN KEY (id_order) REFERENCES Pemesanan(id_order);

ALTER TABLE Pembayaran
ADD CONSTRAINT fk_pembayaran_customers
FOREIGN KEY (id_customers) REFERENCES Customers(id_customers);

ALTER TABLE Pembayaran
ADD CONSTRAINT fk_pembayaran_employee
FOREIGN KEY (id_employee) REFERENCES Employee(id_employee);

ALTER TABLE Pembayaran
ADD CONSTRAINT fk_pembayaran_status
FOREIGN KEY (id_status) REFERENCES Status(id_status);