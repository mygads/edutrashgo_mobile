import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edutrashgo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const Kuis(), // Gunakan Kuis sebagai layar utama
    );
  }
}

class Kuis extends StatefulWidget {
  const Kuis({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _KuisPage();
}

class _KuisPage extends State<Kuis> {
  int _selectedAnswerIndex = -1;
  int _currentQuestion = 1;
  int _totalQuestions = 5;

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Kuis Pemula 1'),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: _currentQuestion / _totalQuestions,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ), 
                Text('$_currentQuestion/$_totalQuestions'),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset("images/luffy.jpeg"),
            const Text(
              'Sampah Manakah Yang Berbahaya?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnswerOption('NIFTY50', 'A.', 0),
                const SizedBox(height: 8),
                _buildAnswerOption('NIFTYNEXT50', 'B.', 1),
                const SizedBox(height: 8),
                _buildAnswerOption('Sampah', 'C.', 2),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol "SELANJUTNYA" di sini
              },
              child: const Text('SELANJUTNYA'),
            ),
            const SizedBox(height: 20), // Atur jarak di sini
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(String title, String option, int index) {
    final isSelected = _selectedAnswerIndex == index;
    return InkWell(
      onTap: () => _selectAnswer(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              option,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}