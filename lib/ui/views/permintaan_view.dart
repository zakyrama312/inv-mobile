// lib/ui/views/permintaan_view.dart
import 'package:flutter/material.dart';
import 'form_permintaan_view.dart';

class PermintaanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permintaan Barang (BHP)"),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          // Tombol Tambah Permintaan sesuai Kebutuhan Pengguna (Tabel 3.1)
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormPermintaanView()),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text("Tambah Permintaan Baru"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          Divider(thickness: 1),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Riwayat Permintaan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Expanded(child: _buildHistoryRequestList()),
        ],
      ),
    );
  }

  Widget _buildHistoryRequestList() {
    // Data dummy berdasarkan field Tabel 3.12 (Permintaan)
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text("Kertas A4 (1 Rim)"),
            subtitle: Text("Tanggal: 26 Jan 2024\nStatus: Selesai"),
            isThreeLine: true,
            trailing: Icon(Icons.info_outline),
          ),
        );
      },
    );
  }
}
