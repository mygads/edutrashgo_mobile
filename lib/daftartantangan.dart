import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'detailtantangan.dart';

class DaftarTantangan extends StatefulWidget {
  const DaftarTantangan({super.key});

  @override
  State<StatefulWidget> createState() => _DaftarTantanganPage();
}

class _DaftarTantanganPage extends State<DaftarTantangan> {
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
      // Handle the socket exception here
    } catch (e) {
      // Handle other exceptions here
    }
  }

  Widget buildTantanganCard(Map<String, dynamic> tantangan) {
    return GestureDetector(
      onTap: () {
        bool isMissionCompleted = false; // Replace this logic with the appropriate one
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTantangan(
              idTantangan: tantangan['id_tantangan'] as int,
              isMissionCompleted: isMissionCompleted,
              tantangan: tantangan,
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
              const SizedBox(height: 8),
              Text(
                tantangan["hadiah"] ?? "",
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
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
        padding: const EdgeInsets.all(16),
        itemCount: tantanganList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildTantanganCard(tantanganList[index]);
        },
      ),
      backgroundColor: Color.fromARGB(255, 200, 200, 200),  // Changed background color
    );
  }
}
