// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:edutrashgo_mobile/admin/admin_createtantangan.dart';
import 'package:edutrashgo_mobile/admin/admin_detailtantangan.dart';
import 'package:edutrashgo_mobile/admin/admin_updatetantangan.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AdminDaftarTantangan extends StatefulWidget {
  const AdminDaftarTantangan({super.key});

  @override
  State<StatefulWidget> createState() => _AdminDaftarTantanganPage();
}

class _AdminDaftarTantanganPage extends State<AdminDaftarTantangan> {
  List<dynamic> tantanganList = [];

  @override
  void initState() {
    super.initState();
    fetchTantangan();
  }

  Future<void> fetchTantangan() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/tantangan'));

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        setState(() {
          tantanganList = result['data'] ?? [];
        });
      } else {
        throw Exception('Failed to load tantangan');
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load tantangan: No Internet connection'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load tantangan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> deleteTantangan(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2:8000/api/tantangan/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        setState(() {
          tantanganList.removeWhere((tantangan) => tantangan['id_tantangan'] == id);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tantangan berhasil dihapus'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        final result = json.decode(response.body);
        throw Exception('Failed to delete tantangan: ${result['message']}');
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete tantangan: No Internet connection'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus tantangan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void showBottomSheet(BuildContext context, int id) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Update'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminUpdateTantangan(
                      tantangan: tantanganList.firstWhere((tantangan) => tantangan['id_tantangan'] == id),
                    ),
                  ),
                ).then((value) {
                  if (value == true) {
                    fetchTantangan();
                  }
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                deleteTantangan(id);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildTantanganCard(Map<String, dynamic> tantangan) {
    return GestureDetector(
      onTap: () {
        bool isMissionCompleted = false; // Replace this logic with the appropriate one
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminDetailTantangan(
              idTantangan: tantangan['id_tantangan'] as int,
              isMissionCompleted: isMissionCompleted,
              tantangan: tantangan,
            ),
          ),
        ).then((value) {
          if (value == true) {
            fetchTantangan();
          }
        });
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
                    tantangan["judul"] ?? "",
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
                tantangan["deskripsi"] ?? "",
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 93, 93, 93),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                tantangan["hadiah"] ?? "",
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Tenggat waktu: ${tantangan["batas_waktu"] ?? ""}',
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      showBottomSheet(context, tantangan['id_tantangan']);
                    },
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
        backgroundColor: Colors.white,
        title: const Text(
          'Daftar Tantangan',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tantanganList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildTantanganCard(tantanganList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminCreateTantangan()),
          ).then((value) {
            if (value == true) {
              fetchTantangan();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),  // Changed background color
    );
  }
}
