import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/coursemate_text.png', // Ganti dengan path gambar yang sesuai
              height: 32, // Sesuaikan tinggi gambar sesuai kebutuhan
              fit: BoxFit.contain,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF333333),
        actions: <Widget>[
          IconButton(
            // Membuat IconButton dengan ikon Icons.shopping_bag.
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              size: 25.0,
            ),
            // Menambahkan tooltip yang akan muncul saat pengguna mengarahkan kursor ke tombol.
            tooltip: 'Profile',
            // Menetapkan fungsi yang akan dijalankan ketika tombol ditekan.
            onPressed: () {
              // Fungsi yang akan dijalankan saat tombol ditekan.
              // Isi fungsi dapat diisi dengan kode yang ingin dijalankan ketika tombol ditekan.
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>

              //       ), // Ganti CartPage dengan nama halaman Anda.
              // );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFFFFFFFF),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: SizedBox(
                          width: double.infinity,
                          child: Stack(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFFF1F0F0),
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 25,
                                          bottom: 53,
                                          left: 24,
                                          right: 24),
                                      width: double.infinity,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 27),
                                                width: double.infinity,
                                                child: Row(children: [
                                                  Expanded(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      width: double.infinity,
                                                      child: const Text(
                                                        'Mari kita buat bumi bersih',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF363636),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 2, right: 2),
                                                    width: 16,
                                                    height: 16,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://i.imgur.com/1tMFzp8.png"),
                                                          fit: BoxFit.cover),
                                                    ),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 2),
                                                                height: 12,
                                                                width: double
                                                                    .infinity,
                                                                child: Image
                                                                    .network(
                                                                  'https://i.imgur.com/1tMFzp8.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                          ),
                                                        ]),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                            IntrinsicHeight(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 14),
                                                width: double.infinity,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {},
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 28,
                                                                    bottom: 15),
                                                            width: 160,
                                                            child: Column(
                                                                children: [
                                                                  IntrinsicHeight(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                        color: const Color(
                                                                            0xFF0DCE98),
                                                                      ),
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          17),
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              13,
                                                                          left:
                                                                              44,
                                                                          right:
                                                                              44),
                                                                      width: double
                                                                          .infinity,
                                                                      child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 38,
                                                                                height: 38,
                                                                                child: Image.network(
                                                                                  'https://i.imgur.com/1tMFzp8.png',
                                                                                  fit: BoxFit.fill,
                                                                                )),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            10,
                                                                        left:
                                                                            36,
                                                                        right:
                                                                            36),
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        const Text(
                                                                      'Modul\nPembelajaran',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF363636),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            61),
                                                                    child:
                                                                        const Text(
                                                                      '2 Modul',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF82A6B0),
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        28),
                                                            width: 160,
                                                            child: Column(
                                                                children: [
                                                                  IntrinsicHeight(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                        color: const Color(
                                                                            0xFF0DCE98),
                                                                      ),
                                                                      padding: const EdgeInsets.only(
                                                                          top:
                                                                              17,
                                                                          bottom:
                                                                              17,
                                                                          left:
                                                                              16,
                                                                          right:
                                                                              16),
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              13,
                                                                          left:
                                                                              44,
                                                                          right:
                                                                              44),
                                                                      width: double
                                                                          .infinity,
                                                                      child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 38,
                                                                                height: 38,
                                                                                child: Image.network(
                                                                                  'https://i.imgur.com/1tMFzp8.png',
                                                                                  fit: BoxFit.fill,
                                                                                )),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            12,
                                                                        left:
                                                                            64,
                                                                        right:
                                                                            64),
                                                                    child:
                                                                        const Text(
                                                                      'Kuis',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF363636),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            64),
                                                                    child:
                                                                        const Text(
                                                                      '3 Kuis',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF82A6B0),
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            IntrinsicHeight(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {},
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 28,
                                                                    bottom: 28,
                                                                    left: 45,
                                                                    right: 45),
                                                            width: 160,
                                                            child: Column(
                                                                children: [
                                                                  IntrinsicHeight(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                        color: const Color(
                                                                            0xFF0DCE98),
                                                                      ),
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          17),
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              14),
                                                                      width: double
                                                                          .infinity,
                                                                      child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: SizedBox(
                                                                                  height: 38,
                                                                                  width: double.infinity,
                                                                                  child: Image.network(
                                                                                    'https://i.imgur.com/1tMFzp8.png',
                                                                                    fit: BoxFit.fill,
                                                                                  )),
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            11),
                                                                    child:
                                                                        const Text(
                                                                      'Tantangan',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF363636),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    '3 Tantangan',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF82A6B0),
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        28),
                                                            width: 160,
                                                            child: Column(
                                                                children: [
                                                                  IntrinsicHeight(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                        color: const Color(
                                                                            0xFF0DCE98),
                                                                      ),
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          17),
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              13,
                                                                          left:
                                                                              43,
                                                                          right:
                                                                              43),
                                                                      width: double
                                                                          .infinity,
                                                                      child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 38,
                                                                                height: 38,
                                                                                child: Image.network(
                                                                                  'https://i.imgur.com/1tMFzp8.png',
                                                                                  fit: BoxFit.fill,
                                                                                )),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            12,
                                                                        left:
                                                                            60,
                                                                        right:
                                                                            60),
                                                                    child:
                                                                        const Text(
                                                                      'Berita',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF363636),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            61),
                                                                    child:
                                                                        const Text(
                                                                      '3 Berita',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF82A6B0),
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ]),
                            Positioned(
                              top: 0,
                              right: 0,
                              width: 390,
                              height: 213,
                              child: Container(
                                padding: const EdgeInsets.only(right: 12),
                                transform:
                                    Matrix4.translationValues(0, -202, 0),
                                width: 390,
                                height: 213,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://i.imgur.com/1tMFzp8.png"),
                                      fit: BoxFit.cover),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 72, bottom: 3, left: 251),
                                        child: const Text(
                                          'EDU TRASHGO',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 142),
                                        width: double.infinity,
                                        child: const Text(
                                          'Solusi belajar menyenangkan untuk mencintai lingkungan',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          color: const Color(0xFF333333),
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 24, left: 23, right: 23),
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    width: 24,
                                    height: 27,
                                    child: Image.network(
                                      'https://i.imgur.com/1tMFzp8.png',
                                      fit: BoxFit.fill,
                                    )),
                                const Text(
                                  '©2024 | EduTrashgo',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 10,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
