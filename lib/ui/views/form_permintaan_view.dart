// lib/ui/views/form_permintaan_view.dart
import 'package:flutter/material.dart';

class FormPermintaanView extends StatefulWidget {
  @override
  _FormPermintaanViewState createState() => _FormPermintaanViewState();
}

class _FormPermintaanViewState extends State<FormPermintaanView> {
  // Controller berdasarkan field di Tabel 3.12
  final TextEditingController _tglPermintaan = TextEditingController();
  final TextEditingController _keperluan = TextEditingController();
  final TextEditingController _jumlah = TextEditingController();
  final TextEditingController _noTelp = TextEditingController();

  String? _selectedBHP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Permintaan Baru")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Identifikasi kebutuhan fungsional (Tabel 3.1)
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Pilih Barang Habis Pakai",
                ),
                items: ["Tinta Printer", "Kertas HVS", "Kabel LAN"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) =>
                    setState(() => _selectedBHP = val as String?),
              ),
              SizedBox(height: 15),

              TextField(
                controller: _jumlah,
                decoration: InputDecoration(labelText: "Jumlah (Unit/Pack)"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              TextField(
                controller: _noTelp,
                decoration: InputDecoration(labelText: "Nomor Telepon"),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),

              TextField(
                controller: _tglPermintaan,
                decoration: InputDecoration(
                  labelText: "Tanggal Permintaan",
                  icon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () {
                  // Logika DatePicker untuk akurasi informasi (Source 12)
                },
              ),
              SizedBox(height: 15),

              TextField(
                controller: _keperluan,
                maxLines: 3,
                decoration: InputDecoration(labelText: "Keperluan Penggunaan"),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Mengirim data ke API api_permintaan.php case 'insert'
                },
                child: Text("Kirim Permintaan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
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
