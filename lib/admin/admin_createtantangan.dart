// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AdminCreateTantangan extends StatefulWidget {
  const AdminCreateTantangan({super.key});

  @override
  _AdminCreateTantanganState createState() => _AdminCreateTantanganState();
}

class _AdminCreateTantanganState extends State<AdminCreateTantangan> {
  final _formKey = GlobalKey<FormState>();
  String judul = '';
  String deskripsi = '';
  DateTime? batasWaktu;
  String hadiah = '';
  List<Map<String, String>> misiList = [];
  bool _isLoading = false;

  Future<void> createTantangan() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/tantangan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'judul': judul,
        'deskripsi': deskripsi,
        'batas_waktu': batasWaktu?.toIso8601String() ?? '',
        'hadiah': hadiah,
        'tanggal_upload': DateTime.now().toIso8601String(),
        'tanggal_update': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final int idTantangan = responseData['data']['id_tantangan'];

      for (var misi in misiList) {
        await createTantanganDetail(idTantangan, misi['misi']!, misi['tugas']!);
      }

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tantangan Baru Berhasil Dibuat'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal membuat tantangan'),
          backgroundColor: Colors.red,
        ),
      );
      throw Exception('Failed to create tantangan');
    }
  }

  Future<void> createTantanganDetail(int idTantangan, String misi, String tugas) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/tantangan-detail'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_tantangan': idTantangan,
        'misi': misi,
        'tugas': tugas,
        'tanggal_upload': DateTime.now().toIso8601String(),
        'tanggal_update': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create tantangan detail');
    }
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          batasWaktu = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        });
      }
    }
  }

  void _addMisi() {
    setState(() {
      misiList.add({'misi': '', 'tugas': ''});
    });
  }

  void _removeMisi(int index) {
    setState(() {
      misiList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Tantangan Baru'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Judul',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    judul = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    deskripsi = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      batasWaktu == null
                          ? 'Pilih Batas Waktu'
                          : 'Batas Waktu: ${batasWaktu!.toLocal().toString().substring(0, 16)}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.black),
                    onPressed: () => _selectDateTime(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Hadiah',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    hadiah = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Misi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              ...misiList.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> misi = entry.value;
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Misi ${index + 1}',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          misiList[index]['misi'] = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tugas ${index + 1}',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          misiList[index]['tugas'] = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
                      ),
                      onPressed: () => _removeMisi(index),
                      child: const Text('Hapus Misi'),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.teal[800], // Text color
                ),
                onPressed: _addMisi,
                child: const Text('Tambah Misi'),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.teal[800], // Text color
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      createTantangan();
                    }
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('Buat Tantangan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
