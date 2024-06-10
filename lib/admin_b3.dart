import 'package:flutter/material.dart';

class AdminB3 extends StatefulWidget {
  const AdminB3({super.key});

  @override
  _AdminB3State createState() => _AdminB3State();
}

class _AdminB3State extends State<AdminB3> {
  List<String> dummyData = [
    "B3 (1)",
    "B3 (2)",
    "B3 (3)",
    "B3 (4)",
    "B3 (5)",
    "B3 (6)",
    "B3 (7)",
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
                _navigateToUpdateContent(context, index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                _deleteData(index);
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

  void _navigateToAddContent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddContentScreen()),
    ).then((newData) {
      if (newData != null) {
        setState(() {
          dummyData.add(newData);
        });
      }
    });
  }

  void _navigateToUpdateContent(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateContentScreen(data: dummyData[index])),
    ).then((updatedData) {
      if (updatedData != null) {
        setState(() {
          dummyData[index] = updatedData;
        });
      }
    });
  }

  void _deleteData(int index) {
    setState(() {
      dummyData.removeAt(index);
    });
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
          color: const Color(0xFFEB4D4B)
        ),
        title: const Text(
          'Sampah Anorganik',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFFEB4D4B)
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  child: Text(
                    'Sampah anorganik itu beda dari sampah lain. Ini kayak botol plastik, kertas, kaleng, atau barang-barang yang nggak bisa rusak sendiri.  \n\n'
                    'Sampah anorganik, bisa di daur ulang menjadi mainan baru atau benda-benda yang berguna lagi. Jadi, kalau melihat sampah kayak begini, simpan di tempat sampah yang benar ya!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: dummyData.asMap().entries.map((entry) {
                  int index = entry.key;
                  String imageName = entry.value;
                  return GestureDetector(
                    onTap: () {
                      _showPopupMenu(context, index);
                    },
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/$imageName.png'),
                          fit: BoxFit.cover,
                        ),
                        color: const Color(0xFF0DCE98),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddContent(context),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Content'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Nama Gambar'),
              ),
              ElevatedButton(
                onPressed: () {
                  String newData = controller.text.trim();
                  if (newData.isNotEmpty) {
                    Navigator.pop(context, newData);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateContentScreen extends StatelessWidget {
  final String data;

  const UpdateContentScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: data);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Content'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Nama Gamnbar'),
              ),
              ElevatedButton(
                onPressed: () {
                  String updatedData = controller.text.trim();
                  if (updatedData.isNotEmpty) {
                    Navigator.pop(context, updatedData);
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
