import 'package:edutrashgo_mobile/daftarkuis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edutrashgo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DaftarKuis(), // Gunakan Kuis sebagai layar utama
    );
  }
}