import 'package:flutter/material.dart';

class JenisSampah extends StatelessWidget {
  const JenisSampah({super.key});

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
        title: const Text('Jenis - Jenis Sampah'),
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const JenisSampah()));
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DaurUlang()));
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DaurUlang()));
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