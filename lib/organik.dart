import 'package:flutter/material.dart';

class Organik extends StatelessWidget {
  const Organik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFF737373),
        ),
        title: const Text(
            'Sampah Organik',
            style: TextStyle(
              fontFamily: 'Poppins', // Specify the font family
              fontSize: 18, // Specify the font size
              fontWeight: FontWeight.w600,
              color: Color(0xFF737373) // Specify the font weight/ Specify the font color
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
                    'Sampah organik itu seperti sisa makanan yang sudah nggak bisa dimakan, daun-daun yang jatuh dari pohon, atau kulit buah. \n\n'
                    'Nah, sampah ini bisa diubah jadi sesuatu yang bagus buat tanaman, seperti pupuk. Jadi, kalau kita pisahkan sampah yang kayak begini, kita bisa bantu tanah jadi lebih subur!',
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
                        image: AssetImage('assets/images/Organik1.png'),
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
                        image: AssetImage('assets/images/Organik2.png'),
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
                        image: AssetImage('assets/images/Organik3.png'),
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
                        image: AssetImage('assets/images/Organik4.png'),
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
                        image: AssetImage('assets/images/Organik5.png'),
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
                        image: AssetImage('assets/images/Organik6.png'),
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
                        image: AssetImage('assets/images/Organik7.png'),
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
