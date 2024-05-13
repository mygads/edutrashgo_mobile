
import "package:edutrashgo_mobile/daurulang.dart";
import "package:edutrashgo_mobile/jenissampah.dart";
import "package:flutter/material.dart";


class DaftarModul extends StatefulWidget {
  const DaftarModul({super.key});

  @override
  State<DaftarModul> createState() => _DaftarModulState();
}

class _DaftarModulState extends State<DaftarModul> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Aksi ketika tombol panah ke kiri ditekan
          },
        ),
        title: const Text('Modul Pembelajaran'),
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
                  'Yuk, Kita belajar dan mengenal dan memperbaiki bumi ini.',
                  style: TextStyle(
                    fontSize: 18.0,
                    // fontFamily: 
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const JenisSampah()));
              },
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/JenisSampah.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Color(0xFF078360),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DaurUlang()));
              },
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/DaurUlang.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Color(0xFF078360),
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