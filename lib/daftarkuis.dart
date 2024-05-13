//import 'package:edutrashgo_mobile/kuis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edutrashgo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const DaftarKuis(), // Gunakan Kuis sebagai layar utama
    );
  }
}

class DaftarKuis extends StatefulWidget {
  const DaftarKuis({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DaftarKuisPage();
}

class _DaftarKuisPage extends State<DaftarKuis> {
  // Buat contoh data daftar kuis
  final List<Map<String, String>> daftarKuis = [
    {'nama': 'Kuis Pemula 1', 'score': '0/100', 'jumlahKuis': '5 Kuis','gambar': 'luffy.jpeg'},
    {'nama': 'Kuis Pemula 2', 'score': '0/100', 'jumlahKuis': '10 Kuis','gambar': 'luffy.jpeg'},
    {'nama': 'Kuis Pemula 3', 'score': '0/100', 'jumlahKuis': '15 Kuis','gambar': 'luffy.jpeg'},
    {'nama': 'Kuis Pemula 4', 'score': '0/100', 'jumlahKuis': '20 Kuis','gambar': 'luffy.jpeg'},
    {'nama': 'Kuis Pemula 5', 'score': '0/100', 'jumlahKuis': '25 Kuis','gambar': 'luffy.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kuis'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
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
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Spacer
                      Row(
                        children: [
                          Image.asset(
                            'images/${daftarKuis[index]['gambar']}',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            daftarKuis[index]['nama']!,
                            style: const TextStyle(fontFamily: 'poppins'),
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
                // Contoh: Navigator.push...
              },
            ),
          );
        },
      ),
    );
  }
}
