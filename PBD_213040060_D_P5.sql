-- No.1
-- Buatkan query tabel dari gambar skema yang sudah ditentukan
create table jurusan (
	id bigint primary key identity(1,1),
	nama_jurusan bigint
);

create table dosen_wali (
	id bigint primary key identity(1,1),
	NIP bigint,
	nama varchar,
	tanggal_lahir date,
	alamat varchar,
	no_hp int

);

create table mahasiswa (
	id bigint primary key identity(1,1),
	NPM bigint,
	nama varchar,
	tanggal_lahir date,
	no_hp int,
	jurusan_id bigint foreign key (jurusan_id) references jurusan(id),
	dosen_wali_id bigint foreign key (dosen_wali_id) references dosen_wali(id)
);

-- No.2
-- tambahkkan field “status” dengan tipe data boolean di tabel mahasiswa
alter table mahasiswa
add status bit;


-- No.3
-- masukan data ke tabel jurusan sebanyak 5 data
insert into jurusan (nama_jurusan) 
values 
    ('Teknik Informatika'),
    ('Sistem Informasi'),
    ('Teknik Elektro'),
    ('Teknik Mesin'),
    ('Teknik Sipil');


-- No.4
-- masukan data ke tabel dosen_wali sebanyak 10 data
-- karna error kita harus merubah dulu varchar tipe datanya
alter table dosen_wali
alter column nama varchar(100);

alter table dosen_wali
alter column alamat varchar(100);

alter table dosen_wali
alter column no_hp varchar(15);


insert into dosen_wali (NIP, nama, tanggal_lahir, alamat, no_hp) 
values 
    (1234567890, 'Dosen A', '1980-01-01', 'Jalan Merdeka No.1', '081234567890'),
    (1234567891, 'Dosen B', '1981-02-02', 'Jalan Merdeka No.2', '081234567891'),
    (1234567892, 'Dosen C', '1982-03-03', 'Jalan Merdeka No.3', '081234567892'),
    (1234567893, 'Dosen D', '1983-04-04', 'Jalan Merdeka No.4', '081234567893'),
    (1234567894, 'Dosen E', '1984-05-05', 'Jalan Merdeka No.5', '081234567894'),
    (1234567895, 'Dosen F', '1985-06-06', 'Jalan Merdeka No.6', '081234567895'),
    (1234567896, 'Dosen G', '1986-07-07', 'Jalan Merdeka No.7', '081234567896'),
    (1234567897, 'Dosen H', '1987-08-08', 'Jalan Merdeka No.8', '081234567897'),
    (1234567898, 'Dosen I', '1988-09-09', 'Jalan Merdeka No.9', '081234567898'),
    (1234567899, 'Dosen J', '1989-10-10', 'Jalan Merdeka No.10', '081234567899');

-- No.5
-- masukan data ke tabel mahasiswa sebanyak 20 data
insert into mahasiswa (NPM, nama, tanggal_lahir, no_hp, jurusan_id, dosen_wali_id) 
values 
    (21000001, 'Mahasiswa A', '2000-01-01', '081200000001', 1, 1),
    (21000002, 'Mahasiswa B', '2000-02-02', '081200000002', 2, 2),
    (21000003, 'Mahasiswa C', '2000-03-03', '081200000003', 3, 3),
    (21000004, 'Mahasiswa D', '2000-04-04', '081200000004', 4, 4),
    (21000005, 'Mahasiswa E', '2000-05-05', '081200000005', 5, 5),
    (21000006, 'Mahasiswa F', '2000-06-06', '081200000006', 1, 6),
    (21000007, 'Mahasiswa G', '2000-07-07', '081200000007', 2, 7),
    (21000008, 'Mahasiswa H', '2000-08-08', '081200000008', 3, 8),
    (21000009, 'Mahasiswa I', '2000-09-09', '081200000009', 4, 9),
    (21000010, 'Mahasiswa J', '2000-10-10', '081200000010', 5, 10),
    (21000011, 'Mahasiswa K', '2000-11-11', '081200000011', 1, 1),
    (21000012, 'Mahasiswa L', '2000-12-12', '081200000012', 2, 2),
    (21000013, 'Mahasiswa M', '2000-01-13', '081200000013', 3, 3),
    (21000014, 'Mahasiswa N', '2000-02-14', '081200000014', 4, 4),
    (21000015, 'Mahasiswa O', '2000-03-15', '081200000015', 5, 5),
    (21000016, 'Mahasiswa P', '2000-04-16', '081200000016', 1, 6),
    (21000017, 'Mahasiswa Q', '2000-05-17', '081200000017', 2, 7),
    (21000018, 'Mahasiswa R', '2000-06-18', '081200000018', 3, 8),
    (21000019, 'Mahasiswa S', '2000-07-19', '081200000019', 4, 9),
    (21000020, 'Mahasiswa T', '2000-08-20', '081200000020', 5, 10);

-- No.6
-- Ubah tipe data nama_jurusan di tabel jurusan menjadi varchar
alter table jurusan
alter column nama_jurusan varchar(100);

-- No.7
-- alter table mahasiswa 
add constraint fk_jurusan foreign key (jurusan_id) references jurusan(id) on delete cascade;

alter table mahasiswa 
add constraint fk_dosen_wali foreign key (dosen_wali_id) references dosen_wali(id) on delete cascade;

-- No.8
-- hapus data 5 mahasiswa dan pastikan data yang berhubungan dengan mahasiswa tersebut di tabel lain ikut terhapus.
-- Step 1
alter table mahasiswa 
add constraint fk_jurusan foreign key (jurusan_id) references jurusan(id) on delete cascade;

alter table mahasiswa 
add constraint fk_dosen_wali foreign key (dosen_wali_id) references dosen_wali(id) on delete cascade;

--Step 2
delete from mahasiswa
where id in (select top 5 id from mahasiswa order by id);



