import 'package:edutrashgo_mobile/detailtantangan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edutrashgo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const DaftarTantangan(),
    );
  }
}

class DaftarTantangan extends StatefulWidget {
  const DaftarTantangan({super.key});

  @override
  State<StatefulWidget> createState() => _DaftarTantanganPage();
}

class _DaftarTantanganPage extends State<DaftarTantangan> {
  final List<Map<String, String>> tantanganList = [
    {
      "title": "Tantangan 1",
      "description": "Selesaikan Tantangan",
      "reward": "Dapatkan Voucher 5.000",
      "deadline": "07/07/2023"
    },
    {
      "title": "Tantangan 2",
      "description": "Selesaikan Tantangan",
      "reward": "Dapatkan Voucher 10.000",
      "deadline": "15/08/2023"
    },
    // Tambahkan tantangan lain di sini
  ];

  Widget buildTantanganCard(Map<String, String> tantangan) {
    return GestureDetector(
      onTap: () {
        bool isMissionCompleted = false; // Gantilah logika ini dengan logika yang sesuai
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTantangan(
              tantangan: tantangan,
              isMissionCompleted: isMissionCompleted,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tantangan["title"]!,
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  ),
                  const Icon(Icons.book, size: 24),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                tantangan["description"]!,
                style: const TextStyle(
                  fontSize: 16, 
                  color: Colors.green,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 8),
              Text(
                tantangan["reward"]!,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight:FontWeight.w400),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    'Tenggat waktu: ${tantangan["deadline"]!}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tantangan',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tantanganList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildTantanganCard(tantanganList[index]);
        },
      ),
    );
  }
}