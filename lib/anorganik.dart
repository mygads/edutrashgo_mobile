import 'package:flutter/material.dart';

class Anorganik extends StatelessWidget {
  const Anorganik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFFFFBD59),
        ),
        title: const Text(
            'Sampah Anorganik',
            style: TextStyle(
              fontFamily: 'Poppins', // Specify the font family
              fontSize: 18, // Specify the font size
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFBD59), // Specify the font weight/ Specify the font color
            ),
          ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  // width: 300,
                  child: Text(
                    'Sampah anorganik itu beda dari sampah lain. Ini kayak botol plastik, kertas, kaleng, atau barang-barang yang nggak bisa rusak sendiri.  \n\n'
                    'Sampah anorganik, bisa di daur ulang menjadi mainan baru atau benda-benda yang berguna lagi. Jadi, kalau melihat sampah kayak begini, simpan di tempat sampah yang benar ya!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto'
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (1).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFFFFBD59),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (2).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFF0DCE98),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (3).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFFFFBD59),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (4).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFF0DCE98),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (5).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFF0DCE98),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (6).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFFFFBD59),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Anorganik (7).png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFF0DCE98),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
