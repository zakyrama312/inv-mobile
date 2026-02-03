// lib/data/services/barang_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_endpoints.dart';
import '../models/barang_model.dart';

class BarangService {
  // Fungsi untuk mengambil data dari crud_barang.php [cite: 86]
  Future<List<BarangModel>> fetchBarang() async {
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.getBarang));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        // Mapping JSON ke Model Barang [cite: 602]
        return jsonResponse.map((data) => BarangModel.fromJson(data)).toList();
      } else {
        throw Exception('Gagal memuat data barang');
      }
    } catch (e) {
      throw Exception('Kesalahan Koneksi: $e');
    }
  }
}
