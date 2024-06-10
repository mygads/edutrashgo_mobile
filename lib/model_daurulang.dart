import 'dart:convert';
import 'package:http/http.dart' as http;

class AdminDaurUlang {
  String judul;
  String deskripsi;
  String konten;
  String? urlVideo;

  AdminDaurUlang({
    required this.judul,
    required this.deskripsi,
    required this.konten,
    this.urlVideo,
  });

  factory AdminDaurUlang.fromJson(Map<String, dynamic> object) {
    return AdminDaurUlang(
      judul: object['judul'],
      deskripsi: object['deskripsi'],
      konten: object['konten'],
      urlVideo: object['url_video'],
    );
  }

  static Future<List<AdminDaurUlang>> getDaurUlang() async {
    String apiUrl = "http://127.0.0.1:8000/api/konten-daur-ulang"; // sesuaikan dengan URL API Anda

    var apiResult = await http.get(Uri.parse(apiUrl));
    if (apiResult.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    var jsonObject = jsonDecode(apiResult.body);
    List<dynamic> listKonten = (jsonObject as List<dynamic>);

    List<AdminDaurUlang> daftarKonten = [];
    for (int i = 0; i < listKonten.length; i++) {
      daftarKonten.add(AdminDaurUlang.fromJson(listKonten[i]));
    }

    return daftarKonten;
  }
}
