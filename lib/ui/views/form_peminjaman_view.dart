import 'package:flutter/material.dart';

class FormPeminjamanView extends StatefulWidget {
  @override
  _FormPeminjamanViewState createState() => _FormPeminjamanViewState();
}

class _FormPeminjamanViewState extends State<FormPeminjamanView> {
  // Controller sesuai Tabel Peminjaman
  final TextEditingController _tglPinjam = TextEditingController();
  final TextEditingController _keperluan = TextEditingController();
  final TextEditingController _jumlah = TextEditingController();

  String? _selectedBarang; // ID Barang dari database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Peminjaman Baru")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Dropdown Barang (Data diambil dari get_barang.php)
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Pilih Barang"),
                items: ["Arduino", "Solder", "Laptop"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) =>
                    setState(() => _selectedBarang = val as String?),
              ),
              SizedBox(height: 15),

              TextField(
                controller: _jumlah,
                decoration: InputDecoration(labelText: "Jumlah Barang"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              TextField(
                controller: _tglPinjam,
                decoration: InputDecoration(
                  labelText: "Tanggal Pinjam (YYYY-MM-DD)",
                  icon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  // Tambahkan DatePicker jika perlu
                },
              ),
              SizedBox(height: 15),

              TextField(
                controller: _keperluan,
                maxLines: 3,
                decoration: InputDecoration(labelText: "Keperluan Peminjaman"),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Kirim data ke API tambah_peminjaman.php
                },
                child: Text("Ajukan Peminjaman"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
