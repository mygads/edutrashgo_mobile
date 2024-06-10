import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminDetailTantangan extends StatefulWidget {
  final bool isMissionCompleted;
  final int idTantangan;
  final Map tantangan;

  const AdminDetailTantangan({
    super.key,
    required this.isMissionCompleted,
    required this.idTantangan,
    required this.tantangan,
  });

  @override
  _AdminDetailTantanganState createState() => _AdminDetailTantanganState();
}

class _AdminDetailTantanganState extends State<AdminDetailTantangan> {
  late Future<List<Map<String, dynamic>>> _futureMissions;
  List<bool> _missionStatus = [];

  @override
  void initState() {
    super.initState();
    _futureMissions = fetchMissions();
  }

  Future<List<Map<String, dynamic>>> fetchMissions() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/tantangan-detail'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true) {
        final missions = List<Map<String, dynamic>>.from(data['data']);
        _missionStatus = List<bool>.filled(missions.length, false);
        return missions;
      } else {
        throw Exception('Failed to load missions');
      }
    } else {
      throw Exception('Failed to load missions');
    }
  }

  bool areAllMissionsCompleted() {
    return _missionStatus.every((status) => status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Tantangan",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureMissions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final missions = snapshot.data!
                  .where((m) => m['id_tantangan'] == widget.idTantangan)
                  .toList();
              return buildMissionList(context, missions);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      backgroundColor: const Color(0xFFE3E3E3),  // Changed background color
    );
  }

  Widget buildMissionList(BuildContext context, List<Map<String, dynamic>> missions) {
    return Padding(
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
                        widget.tantangan["judul"] ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Icon(Icons.book, size: 24),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.tantangan["deskripsi"] ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 93, 93, 93),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.tantangan["hadiah"] ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        'Tenggat waktu: ${widget.tantangan["batas_waktu"] ?? ""}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Misi :',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          ...missions.asMap().entries.map((entry) {
            final index = entry.key;
            final mission = entry.value;
            return buildMissionItem(mission, index);
          }),
          const SizedBox(height: 16),
          
        ],
      ),
    );
  }

  Widget buildMissionItem(Map<String, dynamic> mission, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: _missionStatus[index],
            onChanged: (bool? value) {
              setState(() {
                _missionStatus[index] = value ?? false;
              });
            },
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mission["misi"] ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: _missionStatus[index] ? Colors.green : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mission["tugas"] ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    color: _missionStatus[index] ? Colors.green : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
