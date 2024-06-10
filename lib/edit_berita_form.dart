import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/berita_model.dart';

class EditBeritaForm extends StatefulWidget {
  final Berita berita;

  const EditBeritaForm({super.key, required this.berita});

  @override
  State<EditBeritaForm> createState() => _EditBeritaFormState();
}

class _EditBeritaFormState extends State<EditBeritaForm> {
  final _formKey = GlobalKey<FormState>();
  late String judul;
  late String kategori;
  late String konten;
  late String urlGambar;

  @override
  void initState() {
    super.initState();
    judul = widget.berita.judul;
    kategori = widget.berita.kategori;
    konten = widget.berita.konten;
    urlGambar = widget.berita.urlGambar;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Berita updatedBerita = Berita(
        idBerita: widget.berita.idBerita,
        judul: judul,
        kategori: kategori,
        konten: konten,
        urlGambar: urlGambar,
        tanggal_upload: widget.berita.tanggal_upload,
        tanggal_update: DateTime.now(),
      );

      try {
        await Berita.updateBerita(updatedBerita);
        Navigator.pop(context, true);
      } catch (e) {
        print('Failed to update berita: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Berita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: judul,
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
                initialValue: kategori,
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
                initialValue: konten,
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
                initialValue: urlGambar,
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
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
