import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage();
}

class _CodiaPage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xff06825f),
        ),
        child: Column(
          children: [
            const SizedBox(height: 159),
            const Text(
              'EDU TRASHGO',
              textAlign: TextAlign.center,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 40, color: Color(0xffffffff), fontFamily: 'Poppins-SemiBold', fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 4),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Memilah kategori sampah lebih mudah dengan hanya scan.',
                textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins-Regular', fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset('images/logobesar.png', width: 161, height: 176, fit: BoxFit.cover,),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff333333),
                minimumSize: const Size(325, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {
                // Navigate to the next page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                'Mulai',
                style: TextStyle(fontSize: 16, color: Color(0xffffffff), fontFamily: 'Poppins-SemiBold', fontWeight: FontWeight.normal),
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('images/homebawah.png', width: MediaQuery.of(context).size.width, height: 75,),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, bottom: 20),
                  child: Text(
                    '©2024 | EduTrashgo',
                    textAlign: TextAlign.right,
                    style: TextStyle(decoration: TextDecoration.none, fontSize: 10, color: Color(0xffffffff), fontFamily: 'Poppins-Regular', fontWeight: FontWeight.normal),
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
