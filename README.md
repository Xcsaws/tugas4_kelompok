# Tugas 4: Dashboard Energi Terbarukan (SDGs #7)

Aplikasi mobile berbasis Flutter yang mengimplementasikan layout kompleks (`Stack`, `Column`, `Row`, `Card`) serta manipulasi gesture interaktif.

## Anggota Kelompok
1. Rachmat Ramadhon - 202431194
2. Aditiya Tri Mukti - 202431101

## Fitur & Implementasi Gesture (NIM Ganjil)
- **Tap Gesture**: Mengubah status aktif/non-aktif turbin angin dan warna kartu.
- **Long Press Gesture**: Menampilkan statistik detail real-time output daya.
- **Drag / Pan Gesture**: Memindahkan posisi kartu turbin secara bebas di layar.

## Cara Menjalankan
```bash
flutter run
```

## Detail Event Gesture

| Gesture | Event Flutter | Efek pada UI |
|---|---|---|
| Tap | `onTap` | Status turbin berganti AKTIF / NON-AKTIF, warna kartu dan ikon berubah |
| Long Press | `onLongPress` | Panel statistik real-time (output, efisiensi, kecepatan angin) tampil / sembunyi |
| Drag / Pan | `onPanUpdate` | Posisi kartu berpindah mengikuti jari/kursor |

Ketiga gesture dibungkus dengan widget `GestureDetector`, dan perubahan
tampilan dilakukan lewat `setState()`.

## Prasyarat

- Flutter SDK terpasang (cek dengan `flutter doctor`)
- Jalankan `flutter pub get` sebelum `flutter run`

## Pembagian Tugas

- Rachmat Ramadhon: implementasi kode aplikasi (gesture dan layout) dan penyusunan README awal
- Aditiya Tri Mukti: penyempurnaan README, penjelasan teknis (diagram widget tree dan cuplikan kode), tangkapan layar, dan penyusunan laporan PDF
