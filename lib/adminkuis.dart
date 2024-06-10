import 'package:flutter/material.dart';

class AdminKuis extends StatefulWidget {
  final String nama;
  final String score;
  final String jumlahKuis;
  final String gambar;

  const AdminKuis({
    super.key,
    required this.nama,
    required this.score,
    required this.jumlahKuis,
    required this.gambar,
  });

  @override
  State<AdminKuis> createState() => _AdminKuisPage();
}

class _AdminKuisPage extends State<AdminKuis> {
  int _selectedAnswerIndex = -1;
  int _currentQuestionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Sampah Manakah Yang Berbahaya?',
      'options': ['Kaleng', 'Detergen', 'Daun', 'kertas'],
      'image': 'assets/images/trash.jpeg',
    },
    {
      'question': 'Sampah Plastik Termasuk Kedalam Jenis Apa?',
      'options': ['Organik', 'Anorganik', 'B3', 'Udara'],
      'image': 'assets/images/plastik.jpeg',
    },
    {
      'question': 'Mengapa sampah plastik berbahaya bagi lingkungan?',
      'options': [
        'Karena mudah terurai',
        'Karena dapat mencemari tanah dan air',
        'Karena mudah didaur ulang',
        'Karena tidak berbau'
      ],
      'image': 'assets/images/plastik.jpeg',
    },
    {
      'question':
          'Manakah dari berikut ini yang merupakan contoh sampah organik?',
      'options': ['Daun kering', 'Plastik', 'Kaleng bekas', 'Baterai'],
      'image': 'assets/images/trash.jpeg',
    },
    {
      'question': 'Apa yang dimaksud dengan 3R dalam pengelolaan sampah?',
      'options': [
        'Reduce, Reuse, Recycle',
        'Rebus, Rawat, Recycle',
        'Restoran, Reduce, Recycle',
        'Reduce, Reuse, Rebus'
      ],
      'image': 'assets/images/trash.jpeg',
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

  // Fungsi CRUD

  void _createQuestion(Map<String, dynamic> question) {
    setState(() {
      _questions.add(question);
    });
  }

  void _updateQuestion(int index, Map<String, dynamic> question) {
    setState(() {
      _questions[index] = question;
    });
  }

  void _deleteQuestion(int index) {
    setState(() {
      _questions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              widget.nama,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
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
            _buildNextButtonOrFinish(),
            const SizedBox(height: 20), // Atur jarak di sini
          ],
        ),
      ),
      floatingActionButton: _buildAddButton(),
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
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildOptionsList(List<String> options) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: options
          .asMap()
          .entries
          .map((entry) => _buildAnswerOption(entry.value,
              '${String.fromCharCode(65 + entry.key)}.', entry.key))
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
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButtonOrFinish() {
    if (_currentQuestionIndex < _questions.length - 1) {
      return _buildNextButton();
    } else {
      return _buildFinishButton();
    }
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: _nextQuestion,
      child: const Text(
        'SELANJUTNYA',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildFinishButton() {
    return ElevatedButton(
      onPressed: () {
        // Add logic for finishing the quiz
      },
      child: const Text(
        'SELESAI',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return FloatingActionButton(
      onPressed: _showOptionsModal,
      backgroundColor: Colors.green,
      child: Icon(Icons.add),
    );
  }

  void _showOptionsModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Tambah Pertanyaan'),
                onTap: () {
                  Navigator.pop(context);
                  _showQuestionForm();
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Pertanyaan'),
                onTap: () {
                  Navigator.pop(context);
                  // Add logic to edit question
                  _showEditQuestionForm(_questions[_currentQuestionIndex]);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Hapus Pertanyaan'),
                onTap: () {
                  Navigator.pop(context);
                  _deleteQuestion(_currentQuestionIndex);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuestionForm() {
    final TextEditingController questionController = TextEditingController();
    final TextEditingController optionControllerA = TextEditingController();
    final TextEditingController optionControllerB = TextEditingController();
    final TextEditingController optionControllerC = TextEditingController();
    final TextEditingController optionControllerD = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form Pertanyaan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: questionController,
                  decoration: InputDecoration(labelText: 'Pertanyaan'),
                ),
                TextFormField(
                  controller: optionControllerA,
                  decoration: InputDecoration(labelText: 'Opsi A'),
                ),
                TextFormField(
                  controller: optionControllerB,
                  decoration: InputDecoration(labelText: 'Opsi B'),
                ),
                TextFormField(
                  controller: optionControllerC,
                  decoration: InputDecoration(labelText: 'Opsi C'),
                ),
                TextFormField(
                  controller: optionControllerD,
                  decoration: InputDecoration(labelText: 'Opsi D'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Map<String, dynamic> newQuestion = {
                  'question': questionController.text,
                  'options': [
                    optionControllerA.text,
                    optionControllerB.text,
                    optionControllerC.text,
                    optionControllerD.text,
                  ],
                  'image': 'assets/images/trash.jpeg',
                };
                _createQuestion(newQuestion);
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _showEditQuestionForm(Map<String, dynamic> question) {
    final TextEditingController questionController =
        TextEditingController(text: question['question']);
    final TextEditingController optionControllerA =
        TextEditingController(text: question['options'][0]);
    final TextEditingController optionControllerB =
        TextEditingController(text: question['options'][1]);
    final TextEditingController optionControllerC =
        TextEditingController(text: question['options'][2]);
    final TextEditingController optionControllerD =
        TextEditingController(text: question['options'][3]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Pertanyaan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: questionController,
                  decoration: InputDecoration(labelText: 'Pertanyaan'),
                ),
                TextFormField(
                  controller: optionControllerA,
                  decoration: InputDecoration(labelText: 'Opsi A'),
                ),
                TextFormField(
                  controller: optionControllerB,
                  decoration: InputDecoration(labelText: 'Opsi B'),
                ),
                TextFormField(
                  controller: optionControllerC,
                  decoration: InputDecoration(labelText: 'Opsi C'),
                ),
                TextFormField(
                  controller: optionControllerD,
                  decoration: InputDecoration(labelText: 'Opsi D'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Map<String, dynamic> updatedQuestion = {
                  'question': questionController.text,
                  'options': [
                    optionControllerA.text,
                    optionControllerB.text,
                    optionControllerC.text,
                    optionControllerD.text,
                  ],
                  'image': question['image'],
                };
                _updateQuestion(_currentQuestionIndex, updatedQuestion);
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}
