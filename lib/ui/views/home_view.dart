import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final Map userData; // Data dari login (nama, role, prodi)

  const HomeView({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header: Informasi Pengguna
              _buildHeader(),

              // 2. Ringkasan Informasi (Summary Cards)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildSummaryCard(
                      "Dipinjam",
                      "3", // Dummy data: Barang yang sedang dipinjam [cite: 54]
                      Icons.inventory_2,
                      Colors.blue,
                    ),
                    SizedBox(width: 15),
                    _buildSummaryCard(
                      "Total Transaksi",
                      "12", // Dummy data: Riwayat digital [cite: 62]
                      Icons.history,
                      Colors.orange,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // 3. Daftar Peminjaman Aktif
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Peminjaman Aktif",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              // List barang yang sedang dipinjam siswa [cite: 63]
              _buildActiveLoanList(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Header
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Halo,", style: TextStyle(color: Colors.white70)),
                  Text(
                    userData['name'] ?? "User", // Nama dari Tabel Users
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Laboratorium RPL - SMK N 1 Slawi", // Lokasi Objek
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Widget Kartu Ringkasan
  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(height: 15),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Widget List Peminjaman Aktif
  Widget _buildActiveLoanList() {
    // Simulasi data dari Tabel Peminjaman [cite: 609]
    List<Map<String, String>> activeLoans = [
      {"barang": "Arduino Uno", "tgl": "28 Jan 2024", "status": "Dipinjam"},
      {
        "barang": "Multimeter Digital",
        "tgl": "27 Jan 2024",
        "status": "Dipinjam",
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: activeLoans.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.devices, color: Colors.blue),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeLoans[index]['barang']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Tgl Pinjam: ${activeLoans[index]['tgl']}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  activeLoans[index]['status']!,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
