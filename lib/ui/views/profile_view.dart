// lib/ui/views/profile_view.dart
import 'package:flutter/material.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget {
  final Map userData; // Mengambil data user dari login (Source 586)

  ProfileView({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Pengguna"),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header Profil (Identitas Digital)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 60, color: Colors.blue[800]),
                ),
                SizedBox(height: 15),
                Text(
                  userData['name'] ??
                      "User", // Nama dari Tabel Users (Source 586)
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userData['role']?.toUpperCase() ??
                      "ANGGOTA", // Role (admin/kaprodi/anggota) (Source 586)
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Pengaturan Akun & Informasi Tambahan
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _buildProfileItem(
                  Icons.badge,
                  "Username",
                  userData['username'] ?? "-",
                ),
                _buildProfileItem(
                  Icons.school,
                  "Program Studi",
                  "Rekayasa Perangkat Lunak",
                ), // Objek Penelitian (Source 9)
                _buildProfileItem(
                  Icons.location_on,
                  "Lokasi Lab",
                  "SMK Negeri 1 Slawi",
                ), // (Source 16)

                SizedBox(height: 30),

                // Tombol Logout (Kebutuhan Esensial seluruh aktor)
                ElevatedButton.icon(
                  onPressed: () {
                    // Kembali ke LoginView dan hapus semua history navigasi
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.logout),
                  label: Text("Logout dari Sistem"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[800]),
      title: Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
