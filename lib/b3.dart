import 'package:flutter/material.dart';

class B3 extends StatelessWidget {
  const B3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFFEB4D4B)
        ),
        title: const Text(
            'Sampah B3',
            style: TextStyle(
              fontFamily: 'Poppins', // Specify the font family
              fontSize: 18, // Specify the font size
              fontWeight: FontWeight.w600,
              color: Color(0xFFEB4D4B) // Specify the font weight/ Specify the font color
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
                    'Ini sampah yang kita harus lebih hati-hati. Contohnya, baterai yang sudah nggak bisa dipakai, cat, atau obat-obatan.  \n\n'
                    'Sampah ini punya zat-zat yang bisa membuat orang dan lingkungan jadi sakit. Jadi, kalau ada sampah seperti ini, serahkan pada orang dewasa atau tempat sampah yang khusus.',
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
                        image: AssetImage('assets/images/B3 (1).png'),
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
                        image: AssetImage('assets/images/B3 (2).png'),
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
                        image: AssetImage('assets/images/B3 (3).png'),
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
                        image: AssetImage('assets/images/B3 (4).png'),
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
                        image: AssetImage('assets/images/B3 (5).png'),
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
                        image: AssetImage('assets/images/B3 (6).png'),
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
                        image: AssetImage('assets/images/B3 (7).png'),
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
