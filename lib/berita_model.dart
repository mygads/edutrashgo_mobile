import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Berita {
  final int idBerita;
  final String judul;
  final String kategori;
  final String konten;
  final String urlGambar;
  final DateTime tanggal_upload;
  final DateTime tanggal_update;

  Berita({
    required this.idBerita,
    required this.judul,
    required this.kategori,
    required this.konten,
    required this.urlGambar,
    required this.tanggal_upload,
    required this.tanggal_update,
  });

  factory Berita.createBerita(Map<String, dynamic> object) {
    return Berita(
      idBerita: object['id_berita'],
      judul: object['judul'],
      kategori: object['kategori'],
      konten: object['konten'],
      urlGambar: object['url_gambar'],
      tanggal_upload: DateTime.parse(object['tanggal_upload']),
      tanggal_update: DateTime.parse(object['tanggal_update']),
    );
  }

  String getFormattedTanggalUpload() {
    final formatter = DateFormat('MMM d, yyyy • H:mm');
    return formatter.format(tanggal_upload);
  }

  String getFormattedTanggalUpdate() {
    final formatter = DateFormat('MMM d, yyyy • H:mm');
    return formatter.format(tanggal_update);
  }

  static Future<List<Berita>> getDaftarBerita() async {
    String apiUrl = "http://10.0.2.2:8000/api/berita";

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

  static Future<void> addBerita(Berita berita) async {
    String apiUrl = "http://10.0.2.2:8000/api/berita";
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'judul': berita.judul,
        'kategori': berita.kategori,
        'konten': berita.konten,
        'url_gambar': berita.urlGambar,
        'tanggal_upload': berita.tanggal_upload.toIso8601String(),
        'tanggal_update': berita.tanggal_update.toIso8601String(),
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add berita');
    }
  }

  static Future<void> updateBerita(Berita berita) async {
    String apiUrl = "http://10.0.2.2:8000/api/berita/${berita.idBerita}";
    var response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'judul': berita.judul,
        'kategori': berita.kategori,
        'konten': berita.konten,
        'url_gambar': berita.urlGambar,
        'tanggal_upload': berita.tanggal_upload.toIso8601String(),
        'tanggal_update': berita.tanggal_update.toIso8601String(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update berita');
    }
  }

  static Future<void> deleteBerita(int idBerita) async {
    String apiUrl = "http://10.0.2.2:8000/api/berita/$idBerita";
    var response = await http.delete(Uri.parse(apiUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete berita');
    }
  }
}
