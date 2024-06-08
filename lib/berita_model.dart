import 'dart:convert';
import 'package:http/http.dart' as http;

class Berita {
  String kategori;
  String judul;
  String waktu;
  String gambar;

  Berita({
    required this.kategori,
    required this.judul,
    required this.gambar,
    required this.waktu,
  });

  factory Berita.createBerita(Map<String, dynamic> object) {
    return Berita(
      kategori: object['kategori'],
      judul: object['judul'],
      gambar: object['gambar'],
      waktu: object['waktu'],
    );
  }

  static Future<List<Berita>> getDaftarBerita() async {
    String apiUrl = "http://10.0.2.2:8000/api/berita"; // ganti sesuai kebutuhan

    var apiResult = await http.get(Uri.parse(apiUrl));
    if (apiResult.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    var jsonObject = jsonDecode(apiResult.body);
    List<dynamic> listBerita = (jsonObject as Map<String, dynamic>)['data'];

    List<Berita> daftarBerita = [];
    for (int i = 0; i < listBerita.length; i++) {
      daftarBerita.add(Berita.createBerita(listBerita[i]));
    }

    return daftarBerita;
  }
}
