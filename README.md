# PPB (C) - Tugas 1

### Muhammad Hafizh Najwan Noor - 5025221278

Aplikasi Home Made untuk menyimpan resep-resep masakan rumahan

## Link youtube

https://youtu.be/DwhiqFWlKoY

---

## Langkah-Langkah Penggunaan Database SQLite dengan `sqflite`

### **1. Fetch Package `sqflite`**
Tambahkan dependency `sqflite` dan `path` ke file `pubspec.yaml`:
```yaml
dependencies:
  sqflite: ^2.4.2
  path: ^1.8.3
```
Lalu jalankan perintah berikut di terminal untuk mengunduh dependency:
```bash
flutter pub get
```

---

### **2. Buat Model Data**
Model data digunakan untuk merepresentasikan struktur data yang akan disimpan di database. Dalam aplikasi ini, model `Recipe` sudah dibuat di file `recipe.dart`. Model ini berisi atribut seperti `id`, `name`, `text`, `iconPath`, `boxColor`, dan `viewIsSelected`. Model ini juga memiliki metode `fromJson` dan `toJson` untuk konversi data.

---

### **3. Buat Kelas Database**
Buat kelas `AppDatabase` untuk mengelola operasi database seperti membuat tabel, menyimpan data, membaca data, dan menghapus data. Kelas ini bertanggung jawab untuk:
- Membuat tabel database dengan struktur yang sesuai.
- Menyediakan metode untuk menambahkan, membaca, dan menghapus data.
- Menutup koneksi database saat tidak digunakan.

---

### **4. Integrasikan Database ke UI**
Gunakan database di aplikasi Anda, misalnya di file `home.dart`.

#### a. **Inisialisasi Database**
Panggil database saat aplikasi dimulai untuk memuat data dari database ke dalam aplikasi.

#### b. **Tambah Data ke Database**
Gunakan metode `createRecipe` untuk menambahkan data baru ke database.

#### c. **Hapus Data dari Database**
Gunakan metode `deleteRecipe` untuk menghapus data dari database berdasarkan `id`.

#### d. **Gunakan Data di UI**
Tampilkan data dari database di UI menggunakan widget seperti `ListView` untuk menampilkan daftar resep.

---

### **5. Tambahkan Data Baru dengan Dialog**
Gunakan dialog untuk menambahkan data baru ke database. Dialog ini memungkinkan pengguna untuk memasukkan nama resep dan detailnya. Data yang dimasukkan akan disimpan ke database menggunakan metode `createRecipe`.

---

### **6. Tutup Database**
Pastikan database ditutup saat aplikasi tidak digunakan untuk menghindari kebocoran memori. Gunakan metode `close` dari kelas `AppDatabase` di dalam metode `dispose` pada widget.

---

### **7. Jalankan Aplikasi**
Jalankan aplikasi Anda dengan perintah:
```bash
flutter run
```

---

Dengan langkah-langkah di atas, aplikasi Anda dapat menyimpan, membaca, dan menghapus data resep menggunakan database SQLite. Data akan tetap ada meskipun aplikasi ditutup karena disimpan di database lokal.
