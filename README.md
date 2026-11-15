# NusaCafe

Game simulasi kafe 2D *top-down* berbasis *point-and-click* dengan tema **Tech-Nusantara**, dikembangkan menggunakan **Godot Engine v4.7.2** (GDScript).

## Progress Saat Ini

### 1. Lingkungan & Tata Letak Kafe (`Main.tscn`, `Wordl`, `Object`)
* **Desain Interior Kafe:** Tata letak lantai, dinding, pintu masuk (`PINTU`), papan neon (`NUSA CAFE`, `DAFTAR MENU`), meja kasir, jendela dapur (`AREA DAPUR`), serta variasi meja makan (`table2seat` dan `table4seat`) sudah tersusun di dalam *scene* utama.
* **Manajemen Aset Modular:** Pemotongan aset dari *sprite sheet* memanfaatkan properti `Region` pada `Sprite2D`, dengan pemisahan *scene* untuk lingkungan (`wordl`), perabot (`object`), dan aktor (`Player.tscn`).

### 2. Karakter Utama / MC (`Player.tscn`)
* **Kontrol Point-and-Click:** Menggunakan `CharacterBody2D` untuk bergerak menuju titik klik kiri mouse, dilengkapi fitur *sprint* (`Sprint`), pembatasan kecepatan langkah agar tidak bergetar di titik tujuan, serta deteksi berhenti otomatis saat karakter tertahan rintangan.
* **Sistem Animasi 4 Arah:** Menggunakan `AnimatedSprite2D` dengan animasi `idle` serta 4 arah jalan terpisah (`walk_front`, `walk_back`, `walk_left`, `walk_right`).
* **Optimasi Collision:** `CollisionShape2D` difokuskan pada area telapak kaki karakter agar pergerakan di sela-sela meja dan perabot berjalan mulus tanpa tersangkut.

## Struktur Folder Proyek

```text
NusaCafe/
├── assets/
│   ├── environment/     # Aset bangunan & interior
│   ├── furniture/       # Aset meja, kursi, dan kasir
│   ├── food/            # Aset menu makanan & minuman
│   ├── fx/              # Efek visual
│   └── items/           # Item interaksi kafe
├── autoload/            # Skrip global (Singleton)
├── resources/           # Resource Godot (SpriteFrames, dll.)
├── scenes/
│   └── actors/          # Scene karakter (Player.tscn)
└── .gitignore           # Mengecualikan folder cache .godot/
