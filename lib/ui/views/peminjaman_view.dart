import 'package:flutter/material.dart';
import 'form_peminjaman_view.dart';

class PeminjamanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peminjaman Barang"),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          // Bagian Atas: Tombol Tambah Peminjaman Baru
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigasi ke Form Peminjaman Baru
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormPeminjamanView()),
                );
              },
              icon: Icon(Icons.add),
              label: Text("Tambah Peminjaman Baru"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          Divider(thickness: 1),

          // Bagian History Peminjaman
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Riwayat Peminjaman",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Expanded(child: _buildHistoryList()),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    // Simulasi data dari Tabel Peminjaman [cite: 608, 609]
    return ListView.builder(
      itemCount: 5, // Contoh jumlah data
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ListTile(
            leading: Icon(Icons.history_edu, color: Colors.blue),
            title: Text("Laptop ASUS ROG"), // Contoh barang
            subtitle: Text("Pinjam: 25 Jan 2024\nStatus: Disetujui"),
            isThreeLine: true,
            trailing: Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }
}
