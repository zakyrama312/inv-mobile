class BarangModel {
  final String id;
  final String namaBarang;
  final String kodeBarang;
  final int jumlahTersedia;
  final String namaKategori;

  BarangModel({
    required this.id,
    required this.namaBarang,
    required this.kodeBarang,
    required this.jumlahTersedia,
    required this.namaKategori,
  });

  // Factory untuk convert dari JSON PHP ke Object Flutter
  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      id: json['id'],
      namaBarang: json['nama_barang'],
      kodeBarang: json['kode_barang'],
      jumlahTersedia: int.parse(json['jumlah_tersedia'].toString()),
      namaKategori: json['nama_kategori'] ?? '',
    );
  }
}
