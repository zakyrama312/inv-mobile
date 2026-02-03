import 'package:http/http.dart' as http;
import '../../core/constants/api_endpoints.dart';

class PersetujuanService {
  Future<bool> updateStatusPeminjaman(String id, String status) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.updateStatusPinjam),
      body: {
        'id': id,
        'status': status, // 'disetujui' atau 'ditolak'
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
