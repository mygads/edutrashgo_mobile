import 'package:edutrashgo_mobile/kuis.dart';
import 'package:flutter/material.dart';

class DaftarKuis extends StatefulWidget {
  const DaftarKuis({super.key});

  @override
  State<StatefulWidget> createState() => _DaftarKuisPage();
}

class _DaftarKuisPage extends State<DaftarKuis> {
  // Buat contoh data daftar kuis
  final List<Map<String, String>> daftarKuis = [
    {'nama': 'Kuis Pemula 1', 'score': '0/100', 'jumlahKuis': '5 Kuis','gambar': 'trash.jpeg'},
    {'nama': 'Kuis Pemula 2', 'score': '0/100', 'jumlahKuis': '10 Kuis','gambar': 'trash.jpeg'},
    {'nama': 'Kuis Pemula 3', 'score': '0/100', 'jumlahKuis': '15 Kuis','gambar': 'trash.jpeg'},
    {'nama': 'Kuis Pemula 4', 'score': '0/100', 'jumlahKuis': '20 Kuis','gambar': 'trash.jpeg'},
    {'nama': 'Kuis Pemula 5', 'score': '0/100', 'jumlahKuis': '25 Kuis','gambar': 'trash.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kuis',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400
        ),),
      ),
      body: ListView.builder(
        itemCount: daftarKuis.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Text(
                          'Score ${daftarKuis[index]['score']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Spacer
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/${daftarKuis[index]['gambar']}',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            daftarKuis[index]['nama']!,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        daftarKuis[index]['jumlahKuis']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: 'Poppins'
                        ),
                      ),
                      const SizedBox(height: 8), // Spacer
                      const Icon(Icons.arrow_circle_right_outlined),
                    ],
                  ),
                ],
              ),
              onTap: () {
                // Implementasi aksi ketika kuis diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Kuis()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
