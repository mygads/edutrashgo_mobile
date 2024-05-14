import 'package:flutter/material.dart';

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
  int _currentQuestionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Sampah Manakah Yang Berbahaya?',
      'options': ['Kaleng', 'Detergen', 'Daun','kertas'],
      'image': 'images/trash.jpeg',
    },
    {
      'question': 'Sampah Plastik Termasuk Kedalam Jenis Apa?',
      'options': ['Organik', 'Anorganik', 'B3','Udara'],
      'image': 'images/plastik.jpeg',
    },
    {
      'question': 'Mengapa sampah plastik berbahaya bagi lingkungan?',
      'options': ['Karena mudah terurai', 'Karena dapat mencemari tanah dan air', 'Karena mudah didaur ulang','Karena tidak berbau'],
      'image': 'images/plastik.jpeg',
    },
    {
      'question': 'Manakah dari berikut ini yang merupakan contoh sampah organik?',
      'options': ['Daun kering', 'Plastik', 'Kaleng bekas','Baterai'],
      'image': 'images/trash.jpeg',
    },
    {
      'question': 'Apa yang dimaksud dengan 3R dalam pengelolaan sampah?',
      'options': ['Reduce, Reuse, Recycle', 'Rebus, Rawat, Recycle', 'Restoran, Reduce, Recycle','Reduce, Reuse, Rebus'],
      'image': 'images/trash.jpeg',
    },
    // Tambahkan pertanyaan lainnya di sini
  ];

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswerIndex = index;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswerIndex = -1; // Reset selected answer for next question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Kuis Pemula 1',style: 
            TextStyle(
              fontFamily:'Poppins',
              fontWeight: FontWeight.w500,
            ),),
            const Spacer(),
            Text('${_currentQuestionIndex + 1}/${_questions.length}'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProgressIndicator(),
            const SizedBox(height: 20),
            _buildImage(currentQuestion['image']),
            const SizedBox(height: 20),
            _buildQuestionText(currentQuestion['question']),
            const SizedBox(height: 20),
            _buildOptionsList(currentQuestion['options']),
            const SizedBox(height: 20),
            _buildNextButton(),
            const SizedBox(height: 20), // Atur jarak di sini
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / _questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            minHeight: 12,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(width: 10),
        Text('${_currentQuestionIndex + 1}/${_questions.length}'),
      ],
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(imagePath);
  }

  Widget _buildQuestionText(String questionText) {
    return Text(
      questionText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400),
    );
  }

  Widget _buildOptionsList(List<String> options) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: options
          .asMap()
          .entries
          .map((entry) => _buildAnswerOption(entry.value, String.fromCharCode(65 + entry.key) + '.', entry.key))
          .toList(),
    );
  }

  Widget _buildAnswerOption(String title, String option, int index) {
    final isSelected = _selectedAnswerIndex == index;
    return InkWell(
      onTap: () => _selectAnswer(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              option,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: _nextQuestion,
      child: const Text('SELANJUTNYA',
      style: TextStyle(
        fontFamily:'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500),),
    );
  }
}
