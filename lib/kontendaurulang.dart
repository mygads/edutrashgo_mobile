import 'package:flutter/material.dart';

class KontenDaurUlang extends StatelessWidget {
  final String thumbnail;
  final String penjelasan;

  const KontenDaurUlang({
    super.key,
    required this.thumbnail,
    required this.penjelasan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daur Ulang Sampah Organik'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                thumbnail,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Container(
                height: 500,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF0DCE98),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  penjelasan,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}