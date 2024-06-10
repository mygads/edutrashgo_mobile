import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/berita_model.dart';

class AddBeritaForm extends StatefulWidget {
  const AddBeritaForm({super.key});

  @override
  State<AddBeritaForm> createState() => _AddBeritaFormState();
}

class _AddBeritaFormState extends State<AddBeritaForm> {
  final _formKey = GlobalKey<FormState>();
  String judul = '';
  String kategori = '';
  String konten = '';
  String urlGambar = '';

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Berita newBerita = Berita(
        idBerita: 0,
        judul: judul,
        kategori: kategori,
        konten: konten,
        urlGambar: urlGambar,
        tanggal_upload: DateTime.now(),
        tanggal_update: DateTime.now(),
      );

      try {
        await Berita.addBerita(newBerita);
        Navigator.pop(context, true);
      } catch (e) {
        print('Failed to add berita: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Berita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Judul'),
                onSaved: (value) {
                  judul = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kategori'),
                onSaved: (value) {
                  kategori = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kategori tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Konten'),
                onSaved: (value) {
                  konten = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konten tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL Gambar'),
                onSaved: (value) {
                  urlGambar = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'URL Gambar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
