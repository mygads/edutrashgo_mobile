import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/login.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06825f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 160),
              const Text(
                'EDU TRASHGO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none, 
                  fontSize: 40, 
                  color: Color(0xffffffff), 
                  fontFamily: 'Poppins', 
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: const Text(
                  'Memilah kategori sampah lebih mudah dengan hanya scan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none, 
                    fontSize: 16, color: 
                    Color.fromARGB(255, 255, 255, 255), 
                    fontFamily: 'Poppins', 
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Image.asset('images/logobesar.png', width: 161, height: 176, fit: BoxFit.cover,),
              const SizedBox(height: 80),
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text(
                  'Mulai',
                  style: TextStyle(fontSize: 16, color: Color(0xffffffff), fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('images/homebawah.png', width: MediaQuery.of(context).size.width, height: 75, fit: BoxFit.cover),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 20),
                child: Text(
                  '©2024 | EduTrashgo',
                  textAlign: TextAlign.right,
                  style: TextStyle(decoration: TextDecoration.none, fontSize: 10, color: Color(0xffffffff), fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}