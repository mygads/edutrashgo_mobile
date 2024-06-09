import 'package:edutrashgo_mobile/anorganik.dart';
import 'package:edutrashgo_mobile/b3.dart';
import 'package:edutrashgo_mobile/organik.dart';
import 'package:flutter/material.dart';

class AdminJenisSampah extends StatelessWidget {
  const AdminJenisSampah({super.key});

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
            'Modul Pembelajaran',
            style: TextStyle(
              fontFamily: 'Poppins', // Specify the font family
              fontSize: 18, // Specify the font size
              fontWeight: FontWeight.w600, // Specify the font weight/ Specify the font color
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
                  'Yuk, kita temukan jenis sampah! Kenali dan jaga bumi bersih!',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'ABeeZee',
                    ),
                  textAlign: TextAlign.center,
                  
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Organik()));
              },
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Organik.png'),
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
            ),
                const SizedBox(height: 20.0),
                GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Anorganik()));
              },
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Anorganik.png'),
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
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const B3()));
              },
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/B3.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Color(0xFFEB4D4B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}