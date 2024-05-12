import 'package:flutter/material.dart';

class HomeBerita extends StatefulWidget {
  const HomeBerita({super.key});

  @override
  State<HomeBerita> createState() => _HomeBeritaState();
}

class _HomeBeritaState extends State<HomeBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: 46.0, right: 24.0, left: 24.0, bottom: 46.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Row back berita
          const Row(
            children: <Widget>[
              Icon(Icons.arrow_back),
              
              SizedBox(width: 9),
              Text(
                'Berita',
                textAlign: TextAlign.left,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Color(0xff000000),
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(
            height: 16,
          ),

          const Row(
            children: [
              Text(
                'Terkini',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Color(0xff000000),
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),

          //Card Berita
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 25,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 13, top: 11, right: 13, bottom: 11),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/image_I112013248441468.png',
                        width: 80,
                        height: 62,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                          width: 8), // Tambahkan SizedBox untuk memberi jarak
                      const Expanded(
                        // Gunakan Expanded untuk mengatur teks yang berlebihan
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Atur posisi teks ke kiri
                          children: [
                            Text(
                              'Trash',
                              style: TextStyle(
                                color: Color(0xFF31CD63),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'WatchOS 10 preview: widgets all the way down',
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis, // Menggunakan ellipsis untuk menggantikan clip
                              style: TextStyle(
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
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jul 10, 2023 • 4 min ago',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(Icons.more_vert),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
