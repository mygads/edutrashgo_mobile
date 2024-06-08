import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/detail_berita.dart';
import 'package:edutrashgo_mobile/berita_model.dart';

class HomeBerita extends StatefulWidget {
  const HomeBerita({super.key});

  @override
  State<HomeBerita> createState() => _HomeBeritaState();
}

class _HomeBeritaState extends State<HomeBerita> {
  List<Berita> daftarBerita = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBerita();
  }

  Future<void> fetchBerita() async {
    try {
      List<Berita> beritaFromApi = await Berita.getDaftarBerita();
      setState(() {
        daftarBerita = beritaFromApi;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to load data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            Text(
              'Berita',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18,
                color: Color(0xff000000),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 16.0, right: 24.0, left: 24.0, bottom: 46.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    children: [
                      Text(
                        'Terkini',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color(0xff000000),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: daftarBerita.length,
                    itemBuilder: (context, index) {
                      final berita = daftarBerita[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 25,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              // Navigasi
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailBerita()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 13, top: 11, right: 13, bottom: 11),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/${berita.gambar}',
                                        width: 80,
                                        height: 62,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              berita.kategori,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF31CD63),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              berita.judul,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF000000),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        berita.waktu,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF888888),
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const Icon(Icons.more_vert),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
