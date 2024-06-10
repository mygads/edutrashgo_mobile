import 'package:edutrashgo_mobile/adminkuis.dart';
import 'package:flutter/material.dart';

class AdminDaftarKuis extends StatefulWidget {
  const AdminDaftarKuis({Key? key}) : super(key: key);

  @override
  State<AdminDaftarKuis> createState() => _AdminDaftarKuisState();
}

class _AdminDaftarKuisState extends State<AdminDaftarKuis> {
  final List<Map<String, String>> daftarKuis = [
    {
      'nama': 'Kuis Pemula 1',
      'score': '0/100',
      'jumlahKuis': '5 Kuis',
      'gambar': 'trash.jpeg'
    },
    {
      'nama': 'Kuis Pemula 2',
      'score': '0/100',
      'jumlahKuis': '10 Kuis',
      'gambar': 'trash.jpeg'
    },
    {
      'nama': 'Kuis Pemula 3',
      'score': '0/100',
      'jumlahKuis': '15 Kuis',
      'gambar': 'trash.jpeg'
    },
    {
      'nama': 'Kuis Pemula 4',
      'score': '0/100',
      'jumlahKuis': '20 Kuis',
      'gambar': 'trash.jpeg'
    },
    {
      'nama': 'Kuis Pemula 5',
      'score': '0/100',
      'jumlahKuis': '25 Kuis',
      'gambar': 'trash.jpeg'
    },
  ];

  // Method untuk menambahkan kuis baru
  void tambahKuis(Map<String, String> kuis) {
    setState(() {
      daftarKuis.add(kuis);
    });
  }

  // Method untuk mengupdate kuis
  void updateKuis(int index, Map<String, String> kuis) {
    setState(() {
      daftarKuis[index] = kuis;
    });
  }

  // Method untuk menghapus kuis
  void hapusKuis(int index) {
    setState(() {
      daftarKuis.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Kuis',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: daftarKuis.length,
        itemBuilder: (BuildContext context, int index) {
          final kuis = daftarKuis[index];
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
                          'Score ${kuis['score']}',
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
                            'assets/images/${kuis['gambar']}',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            kuis['nama']!,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
                        kuis['jumlahKuis']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: 'Poppins',
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
                  MaterialPageRoute(
                    builder: (context) => AdminKuis(
                      nama: kuis['nama']!,
                      score: kuis['score']!,
                      jumlahKuis: kuis['jumlahKuis']!,
                      gambar: kuis['gambar']!,
                    ),
                  ),
                );
              },
              onLongPress: () {
                // Implementasi aksi ketika kuis ditekan lama
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit'),
                          onTap: () {
                            Navigator.pop(context);
                            // Navigasi ke halaman edit kuis dengan mengirimkan index dan data kuis
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditKuis(
                                  index: index,
                                  kuis: kuis,
                                  onUpdate: updateKuis,
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                          onTap: () {
                            Navigator.pop(context);
                            // Hapus kuis berdasarkan index
                            hapusKuis(index);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.close),
                          title: const Text('Close'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman tambah kuis
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahKuis(
                onTambah: tambahKuis,
              ),
            ),
          );
        },
        backgroundColor: Colors.green, // Mengatur warna hijau
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TambahKuis extends StatefulWidget {
  final Function(Map<String, String>) onTambah;

  const TambahKuis({Key? key, required this.onTambah}) : super(key: key);

  @override
  _TambahKuisState createState() => _TambahKuisState();
}

class _TambahKuisState extends State<TambahKuis> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  final TextEditingController _jumlahKuisController = TextEditingController();
  final TextEditingController _gambarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kuis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Kuis'),
            ),
            TextField(
              controller: _scoreController,
              decoration: const InputDecoration(labelText: 'Score'),
            ),
            TextField(
              controller: _jumlahKuisController,
              decoration: const InputDecoration(labelText: 'Jumlah Kuis'),
            ),
            TextField(
              controller: _gambarController,
              decoration: const InputDecoration(labelText: 'Gambar'),
            ),
            ElevatedButton(
              onPressed: () {
                final kuis = {
                  'nama': _namaController.text,
                  'score': _scoreController.text,
                  'jumlahKuis': _jumlahKuisController.text,
                  'gambar': _gambarController.text,
                };
                widget.onTambah(kuis);
                Navigator.pop(context);
              },
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditKuis extends StatefulWidget {
  final int index;
  final Map<String, String> kuis;
  final Function(int, Map<String, String>) onUpdate;

  const EditKuis({
    Key? key,
    required this.index,
    required this.kuis,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _EditKuisState createState() => _EditKuisState();
}

class _EditKuisState extends State<EditKuis> {
  late TextEditingController _namaController;
  late TextEditingController _scoreController;
  late TextEditingController _jumlahKuisController;
  late TextEditingController _gambarController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.kuis['nama']);
    _scoreController = TextEditingController(text: widget.kuis['score']);
    _jumlahKuisController =
        TextEditingController(text: widget.kuis['jumlahKuis']);
    _gambarController = TextEditingController(text: widget.kuis['gambar']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kuis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Kuis'),
            ),
            TextField(
              controller: _scoreController,
              decoration: const InputDecoration(labelText: 'Score'),
            ),
            TextField(
              controller: _jumlahKuisController,
              decoration: const InputDecoration(labelText: 'Jumlah Kuis'),
            ),
            TextField(
              controller: _gambarController,
              decoration: const InputDecoration(labelText: 'Gambar'),
            ),
            ElevatedButton(
              onPressed: () {
                final kuis = {
                  'nama': _namaController.text,
                  'score': _scoreController.text,
                  'jumlahKuis': _jumlahKuisController.text,
                  'gambar': _gambarController.text,
                };
                widget.onUpdate(widget.index, kuis);
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
