class ApiEndpoints {
  static const String baseUrl = "http://localhost/api-mobile-inv";

  static const String login = "$baseUrl/login.php";
  static const String getBarang = "$baseUrl/crud_barang.php?action=read";
  static const String updateStatusPinjam =
      "$baseUrl/persetujuan_peminjaman.php?action=update_status";
  static const String updateStatusMinta =
      "$baseUrl/persetujuan_permintaan.php?action=update_status";
}
