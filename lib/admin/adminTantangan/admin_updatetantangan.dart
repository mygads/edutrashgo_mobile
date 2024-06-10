import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AdminUpdateTantangan extends StatefulWidget {
  final Map<String, dynamic> tantangan;

  const AdminUpdateTantangan({required this.tantangan, super.key});

  @override
  _AdminUpdateTantanganState createState() => _AdminUpdateTantanganState();
}

class _AdminUpdateTantanganState extends State<AdminUpdateTantangan> {
  final _formKey = GlobalKey<FormState>();
  late String judul;
  late String deskripsi;
  DateTime? batasWaktu;
  late String hadiah;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    judul = widget.tantangan['judul'] ?? '';
    deskripsi = widget.tantangan['deskripsi'] ?? '';
    hadiah = widget.tantangan['hadiah'] ?? '';
    batasWaktu = DateTime.parse(widget.tantangan['batas_waktu']);
  }

  Future<void> updateTantangan() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.put(
      Uri.parse('http://10.0.2.2:8000/api/tantangan/${widget.tantangan['id_tantangan']}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'judul': judul,
        'deskripsi': deskripsi,
        'batas_waktu': batasWaktu?.toIso8601String() ?? '',
        'hadiah': hadiah,
        'tanggal_update': DateTime.now().toIso8601String(),
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tantangan berhasil diperbarui'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal memperbarui tantangan'),
          backgroundColor: Colors.red,
        ),
      );
      throw Exception('Failed to update tantangan');
    }
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: batasWaktu ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(batasWaktu ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          batasWaktu = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perbarui Tantangan'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: judul,
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
                initialValue: deskripsi,
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
                initialValue: hadiah,
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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal[800], // Text color
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      updateTantangan();
                    }
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('Perbarui Tantangan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
