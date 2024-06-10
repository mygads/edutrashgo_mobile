import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/berita_model.dart';

class DetailBerita extends StatelessWidget {
  final Berita berita;

  const DetailBerita({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Berita',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 18,
            color: Color(0xff000000),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            top: 16.0, right: 24.0, left: 24.0, bottom: 46.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image Berita
            Image.asset(
              'assets/images/${berita.urlGambar}',
              width: 363,
              height: 266,
              fit: BoxFit.cover,
            ),

            // Konten Berita
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Berita
                  Text(
                    berita.kategori,
                    style: const TextStyle(
                      color: Color(0xFF31CD63),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    berita.judul,
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${berita.getFormattedTanggalUpload()} • ${berita.getFormattedTanggalUpdate()}',
                    style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Isi Berita
                  Text(
                    berita.konten,
                    style: const TextStyle(
                      color: Color(0xFF4E4B66),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
