import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdminDaurUlang extends StatefulWidget {
  const AdminDaurUlang({super.key});

  @override
  State<AdminDaurUlang> createState() => _AdminDaurUlang();
}

class _AdminDaurUlang extends State<AdminDaurUlang> {
  // Dummy data
  final List<Map<String, String>> data = [
    {
      'judul': 'Organik',
      'deskripsi': 'Membuat kompos dari sampah rumah tangga tanpa bau.',
      'penjelasan': 'Sediakan tempat penampungan penampungan sampah misalnya saja yaitu ember cat ukuran 20 kilogram. \n\n Berikan lubang pada sisi-sisi embernya yang gunanya untuk mengalirkan udara sehingga dapat menghentikan kerja bakteri anaerob yang dapat menimbulkan bau pada ember yang digunakan untuk membuat kompos tersebut. \n\n Kemudian masukkan sampah organik buah-buahan kedalam ember dan segenggam tanah, dan lakukan secara berkala tunggu satu atau tiga bulan. \n\n Kompos alami dari sampah organik buah-buahan sudah dapat dipakai.',
      'url_video': 'https://www.youtube.com/watch?v=WIS_wPLPMQU&t=5s'
    },
    {
      'judul': 'Organik',
      'deskripsi': 'Daur Ulang Sampah Organik Buah-buahan menjadi Eco Enzyme.',
      'penjelasan': 'Sediakan tempat penampungan penampungan sampah misalnya saja yaitu ember cat ukuran 20 kilogram. \n\n Berikan lubang pada sisi-sisi embernya yang gunanya untuk mengalirkan udara sehingga dapat menghentikan kerja bakteri anaerob yang dapat menimbulkan bau pada ember yang digunakan untuk membuat kompos tersebut. \n\n Kemudian masukkan sampah organik buah-buahan kedalam ember dan segenggam tanah, dan lakukan secara berkala tunggu satu atau tiga bulan. \n\n Kompos alami dari sampah organik buah-buahan sudah dapat dipakai.',
      'url_video': 'https://www.youtube.com/watch?v=kwajGch9cKA&t=4s'
    },
    {
      'judul': 'Anorganik',
      'deskripsi': 'Daur Ulang Sampah Organik Buah-buahan menjadi Eco Enzyme.',
      'penjelasan': 'Sediakan tempat penampungan penampungan sampah misalnya saja yaitu ember cat ukuran 20 kilogram. \n\n Berikan lubang pada sisi-sisi embernya yang gunanya untuk mengalirkan udara sehingga dapat menghentikan kerja bakteri anaerob yang dapat menimbulkan bau pada ember yang digunakan untuk membuat kompos tersebut. \n\n Kemudian masukkan sampah organik buah-buahan kedalam ember dan segenggam tanah, dan lakukan secara berkala tunggu satu atau tiga bulan. \n\n Kompos alami dari sampah organik buah-buahan sudah dapat dipakai.',
      'url_video': 'https://www.youtube.com/watch?v=kwajGch9cKA&t=4s'
    },
    {
      'judul': 'Anorganik',
      'deskripsi': 'Daur Ulang Sampah Organik Buah-buahan menjadi Eco Enzyme.',
      'penjelasan': 'Sediakan tempat penampungan penampungan sampah misalnya saja yaitu ember cat ukuran 20 kilogram. \n\n Berikan lubang pada sisi-sisi embernya yang gunanya untuk mengalirkan udara sehingga dapat menghentikan kerja bakteri anaerob yang dapat menimbulkan bau pada ember yang digunakan untuk membuat kompos tersebut. \n\n Kemudian masukkan sampah organik buah-buahan kedalam ember dan segenggam tanah, dan lakukan secara berkala tunggu satu atau tiga bulan. \n\n Kompos alami dari sampah organik buah-buahan sudah dapat dipakai.',
      'url_video': 'https://www.youtube.com/watch?v=kwajGch9cKA&t=4s'
    },
  ];

  void _showPopupMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Update'),
              onTap: () {
                Navigator.pop(context);
                _navigateToUpdateForm(context, index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  data.removeAt(index);
                });
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
  }

  void _navigateToKontenAdminDaurUlang(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KontenAdminDaurUlang(
          onSubmit: (newData) {
            setState(() {
              data.add(newData);
            });
          },
        ),
      ),
    );
  }

  void _navigateToUpdateForm(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KontenAdminDaurUlang(
          data: data[index],
          onSubmit: (updatedData) {
            setState(() {
              data[index] = updatedData;
            });
          },
        ),
      ),
    );
  }

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
          'Daur Ulang Sampah',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
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
                  'Yuk, Mulai Belajar Untuk Mendaur Ulang Sampah Dari Sekarang!',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'AbeeZee',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _showPopupMenu(context, index);
                    },
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0DCE98),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 150.0,
                            height: 90.0,
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/Thumbnail (1).png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['judul']!,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Expanded(
                                    child: Text(
                                      data[index]['deskripsi']!,
                                      style: const TextStyle(
                                        fontFamily: 'ABeeZee',
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => KontenDaurUlang(
                                              penjelasan: data[index]['penjelasan']!,
                                              url_video: data[index]['url_video']!,
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(102, 17),
                                        backgroundColor: Colors.white,
                                        foregroundColor: const Color(0xFF0DCE98),                                        
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        elevation: 5,
                                      ),
                                      child: const Text(
                                        'Tonton Video',
                                        style: TextStyle(
                                          fontFamily: 'Alata',
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToKontenAdminDaurUlang(context),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class KontenAdminDaurUlang extends StatefulWidget {
  final Map<String, String>? data;
  final Function(Map<String, String>) onSubmit;

  const KontenAdminDaurUlang({
    super.key,
    this.data,
    required this.onSubmit,
  });

  @override
  _KontenAdminDaurUlangState createState() => _KontenAdminDaurUlangState();
}

class _KontenAdminDaurUlangState extends State<KontenAdminDaurUlang> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _judulController;
  late TextEditingController _deskripsiController;
  late TextEditingController _penjelasanController;
  late TextEditingController _urlVideoController;

  @override
  void initState() {
    super.initState();
    _judulController = TextEditingController(text: widget.data?['judul'] ?? '');
    _deskripsiController = TextEditingController(text: widget.data?['deskripsi'] ?? '');
    _penjelasanController = TextEditingController(text: widget.data?['penjelasan'] ?? '');
    _urlVideoController = TextEditingController(text: widget.data?['url_video'] ?? '');
  }

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    _penjelasanController.dispose();
    _urlVideoController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newData = {
        'judul': _judulController.text,
        'deskripsi': _deskripsiController.text,
        'penjelasan': _penjelasanController.text,
        'url_video': _urlVideoController.text,
      };
      widget.onSubmit(newData);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konten Admin Daur Ulang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(labelText: 'Judul'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _penjelasanController,
                decoration: const InputDecoration(labelText: 'Penjelasan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _urlVideoController,
                decoration: const InputDecoration(labelText: 'Video URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a video URL';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KontenDaurUlang extends StatefulWidget {
  final String penjelasan;
  final String url_video;

  const KontenDaurUlang({
    super.key,
    required this.penjelasan,
    required this.url_video,
  });

  @override
  State<KontenDaurUlang> createState() => _KontenDaurUlangState();
}

class _KontenDaurUlangState extends State<KontenDaurUlang> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.url_video);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Daur Ulang'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(controller: _controller!),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(widget.penjelasan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
