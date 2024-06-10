import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DaurUlang extends StatefulWidget {
  const DaurUlang({super.key});

  @override
  State<DaurUlang> createState() => _DaurUlangState();
}

class _DaurUlangState extends State<DaurUlang> {
  // Dummy data
  final List<Map<String, String>> data = [
    {
      'thumbnail': 'assets/images/Thumbnail (1).png',
      'judul': 'Organik',
      'deskripsi': 'Membuat kompos dari sampah rumah tangga tanpa bau.',
      'penjelasan': 'Sediakan tempat penampungan penampungan sampah misalnya saja yaitu ember cat ukuran 20 kilogram. \n\n Berikan lubang pada sisi-sisi embernya  yang gunanya untuk mengalirkan udara sehingga dapat menghentikan kerja bakteri anaerob yang dapat menimbulkan bau pada ember yang digunakan untuk membuat kompos tersebut. \n\n Kemudian masukkan sampah organik buah-buahan kedalam ember dan segenggam tanah, dan lakukan secara berkala tunggu satu atau tiga bulan. \n\n Kompos alami dari sampah organik buah-buahan sudah dapat dipakai.',
      'videoURL': 'https://www.youtube.com/watch?v=WIS_wPLPMQU&t=5s'
    },
    {
      'thumbnail': 'assets/images/Thumbnail (2).png',
      'judul': 'Organik',
      'deskripsi': 'Daur Ulang Sampah Organik Buah-buahan menjadi Eco Enzyme.',
      'penjelasan': 'Sediakan tempat penampungan penampungan sampah misalnya saja yaitu ember cat ukuran 20 kilogram. \n\n Berikan lubang pada sisi-sisi embernya  yang gunanya untuk mengalirkan udara sehingga dapat menghentikan kerja bakteri anaerob yang dapat menimbulkan bau pada ember yang digunakan untuk membuat kompos tersebut. \n\n Kemudian masukkan sampah organik buah-buahan kedalam ember dan segenggam tanah, dan lakukan secara berkala tunggu satu atau tiga bulan. \n\n Kompos alami dari sampah organik buah-buahan sudah dapat dipakai.',
      'videoURL': 'https://www.youtube.com/watch?v=kwajGch9cKA&t=4s'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Daur Ulang Sampah',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 300,
                child: Text(
                  'Yuk, Mulai Belajar Untuk Mendaur Ulang Sampah Dari Sekarang!',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'AbeeZee',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // List of data
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Aksi ketika kontainer ditekan
                    },
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0DCE98),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Thumbnail
                          Container(
                            width: 150.0,
                            height: 90.0,
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(data[index]['thumbnail']!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          // Info Container
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['judul']!,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Expanded(
                                    child: Text(
                                      data[index]['deskripsi']!,
                                      style: const TextStyle(
                                        fontFamily: 'ABeeZee',
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => KontenDaurUlang(
                                              thumbnail: data[index]['thumbnail']!,
                                              penjelasan: data[index]['penjelasan']!,
                                              videoURL: data[index]['videoURL']!,
                                            ),
                                          ),
                                        );// Aksi ketika tombol 'Selengkapnya' ditekan
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(102, 17),
                                        backgroundColor: Colors.white, // Warna background
                                        foregroundColor: const Color(0xFF0DCE98), // Warna teks
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        elevation: 5, // Add elevation for shadow effect
                                      ),
                                      child: const Text(
                                        'Tonton Video',
                                        style: TextStyle(
                                          fontFamily: 'Alata',
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KontenDaurUlang extends StatefulWidget {
  final String thumbnail;
  final String penjelasan;
  final String videoURL;

  const KontenDaurUlang({
    super.key,
    required this.thumbnail,
    required this.penjelasan,
    required this.videoURL,
  });

  @override
  State<KontenDaurUlang> createState() => _KontenDaurUlangState();
}

class _KontenDaurUlangState extends State<KontenDaurUlang> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Daur Ulang'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(controller: _controller!),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(widget.penjelasan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
