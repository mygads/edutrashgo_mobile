import 'package:edutrashgo_mobile/daftarkuis.dart';
import 'package:edutrashgo_mobile/daftartantangan.dart';
import 'package:flutter/cupertino.dart';
import "package:edutrashgo_mobile/login.dart";
import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/berita.dart';
import "package:edutrashgo_mobile/daftarmodul.dart";

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda Yakin Ingin Keluar?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Keluar'),
          ),
        ],
      );
    },
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/coursemate_text.png', // Ganti dengan path gambar yang sesuai
              height: 32, // Sesuaikan tinggi gambar sesuai kebutuhan
              fit: BoxFit.contain,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF333333),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app, // Changed icon to exit
              color: Colors.white,
              size: 25.0,
            ),
            tooltip: 'Logout',
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Stack Home Background
          Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              Image.asset(
                'assets/images/home-bg.png',
                fit: BoxFit.fill,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 11.0),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'EDU TRASHGO',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'Solusi belajar menyenangkan untuk mencintai lingkungan',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(25, 13, 25, 25),
            color: const Color(0xFFF1F0F0),
            child: Container(
              // color: Colors.black,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Mari kita buat bumi bersih',
                        style: TextStyle(
                          color: Color(0xFF363636),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  //Card
                  Container(
                    padding: const EdgeInsets.only(top: 31),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            //Card 1
                            Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                color: Colors.white,
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    //Navigasi
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DaftarModul()),
                                    );
                                  },
                                  //Ukuran dari Card
                                  child: SizedBox(
                                    width: 160,
                                    height: 177,
                                    child: Column(
                                      children: [
                                        //Isi dari Card
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          // color: Color.fromARGB(
                                          //     255, 235, 109, 109),
                                          width: 126,
                                          child: Column(
                                            children: <Widget>[
                                              //Icon Card
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: const Color(
                                                            0xFF0DCE98),
                                                      ),
                                                      width: 72,
                                                      height: 72,
                                                      child: const SizedBox()),
                                                  const Icon(
                                                    Icons.library_books,
                                                    color: Colors.white,
                                                    size: 44.0,
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),

                                              const Text(
                                                'Modul Pembelajaran',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF363636),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 7,
                                              // ),
                                              const Text(
                                                '2 Modul',
                                                style: TextStyle(
                                                  color: Color(0xFF82A6B0),
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            const Spacer(),
                            //Card 2
                            Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                color: const Color(0xFFFFFFFF),
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    //Navigasi
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DaftarKuis()),
                                    );
                                  },

                                  //Ukuran dari Card
                                  child: SizedBox(
                                    width: 160,
                                    height: 177,
                                    child: Column(
                                      children: [
                                        //Isi dari Card
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          // color: Color.fromARGB(
                                          //     255, 235, 109, 109),
                                          width: 126,
                                          child: Column(
                                            children: <Widget>[
                                              //Icon Card
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: const Color(
                                                            0xFF0DCE98),
                                                      ),
                                                      width: 72,
                                                      height: 72,
                                                      child: const SizedBox()),
                                                  const Icon(
                                                    Icons.quiz,
                                                    color: Colors.white,
                                                    size: 44.0,
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),

                                              const Text(
                                                'Kuis',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF363636),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              const Text(
                                                '3 Kuis',
                                                style: TextStyle(
                                                  color: Color(0xFF82A6B0),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),

                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            //Card 3
                            Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: const Color(0xFFFFFFFF),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  //Navigasi
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DaftarTantangan()),
                                  );
                                },

                                //Ukuran dari Card
                                child: SizedBox(
                                  width: 160,
                                  height: 177,
                                  child: Column(
                                    children: [
                                      //Isi dari Card
                                      Container(
                                        padding: const EdgeInsets.only(top: 25),
                                        // color: Color.fromARGB(
                                        //      255, 235, 109, 109),
                                        width: 126,
                                        child: Column(
                                          children: <Widget>[
                                            //Icon Card
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xFF0DCE98),
                                                    ),
                                                    width: 72,
                                                    height: 72,
                                                    child: const SizedBox()),
                                                const Icon(
                                                  Icons.emoji_events,
                                                  color: Colors.white,
                                                  size: 44.0,
                                                ),
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            const Text(
                                              'Tantangan',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF363636),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            const Text(
                                              '3 Tantangan',
                                              style: TextStyle(
                                                color: Color(0xFF82A6B0),
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const Spacer(),

                            //Card 4
                            Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: const Color(0xFFFFFFFF),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  //Navigasi
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeBerita()),
                                  );
                                },

                                //Ukuran Card
                                child: SizedBox(
                                  width: 160,
                                  height: 177,
                                  child: Column(
                                    children: [
                                      //Isi dari Card
                                      Container(
                                        padding: const EdgeInsets.only(top: 25),
                                        // color: Color.fromARGB(
                                        //     255, 235, 109, 109),
                                        width: 126,
                                        child: Column(
                                          children: <Widget>[
                                            //Icon Card
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xFF0DCE98),
                                                    ),
                                                    width: 72,
                                                    height: 72,
                                                    child: const SizedBox()),
                                                const Icon(
                                                  Icons.newspaper,
                                                  color: Colors.white,
                                                  size: 44.0,
                                                ),
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            const Text(
                                              'Berita',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF363636),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            const Text(
                                              '3 Berita',
                                              style: TextStyle(
                                                color: Color(0xFF82A6B0),
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Footer
          Expanded(
            child: Container(
              color: const Color(0xFF333333),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Image.asset(
                          'assets/images/icon-app.png',
                          width: 24,
                          height: 27,
                        ),
                        const Spacer(),
                        const Text(
                          '©2024 | EduTrashgo',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '©2024 | EduTrashgo',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
