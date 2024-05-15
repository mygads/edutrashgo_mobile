import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/loadingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduTrashgo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}

