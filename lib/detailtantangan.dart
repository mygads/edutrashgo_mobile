import 'package:flutter/material.dart';

class DetailTantangan extends StatelessWidget {
  final Map<String, String> tantangan;
  final bool isMissionCompleted;

  const DetailTantangan({super.key, required this.tantangan, required this.isMissionCompleted});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> missions = [
      {
        "title": "Selesaikan 1 Kursus!",
        "completed": false, // Ubah menjadi false untuk memastikan teks berwarna hitam
      },
      {
        "title": "Mengikuti proses pembelajaran hingga selesai",
        "completed": isMissionCompleted,
      },
      {
        "title": "Selesaikan 1 Kursus!",
        "completed": false, // Ubah menjadi false untuk memastikan teks berwarna hitam
      },
      {
        "title": "Mengikuti proses pembelajaran hingga selesai",
        "completed": isMissionCompleted,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Tantangan",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
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
                        const Icon(Icons.access_time, size: 20),
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
            const SizedBox(height: 16),
            Text(
              'Misi Kamu :',
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: missions.map((mission) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      if (mission["title"] != "Selesaikan 1 Kursus!")
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mission["completed"] ? Colors.green : Colors.grey,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          mission["title"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: mission["title"] == "Selesaikan 1 Kursus!" ? Colors.black : (mission["completed"] ? Colors.green : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isMissionCompleted
                  ? () {
                      //  logika untuk claim reward
                    }
                  : null,
              child: const Text('Claim',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isMissionCompleted ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
