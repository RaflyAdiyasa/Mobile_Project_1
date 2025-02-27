import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String _resultText = "";

  void _checkAnswers() {
    int score = 0;

    int answer1 = int.tryParse(_controller1.text) ?? -1;
    int answer2 = int.tryParse(_controller2.text) ?? -1;
    int answer3 = int.tryParse(_controller3.text) ?? -1;

    int correctCount = 0;
    if (answer1 == 10) correctCount++;
    if (answer2 == 50) correctCount++;
    if (answer3 == 19) correctCount++;

    if (correctCount == 3) {
      score = 100;
    } else if (correctCount == 2) {
      score = 66;
    } else if (correctCount == 1) {
      score = 33;
    } else {
      score = 0;
    }

    setState(() {
      _resultText = "Nilai Anda: $score";
    });
  }

  void _resetForm() {
    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    setState(() {
      _resultText = "";
    });
  }

  Widget _buildQuestionContainer(
    String question,
    TextEditingController controller,
    String imagePath,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      width: 200,
      height: 300,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 60),
          const SizedBox(height: 10),
          Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("Math--Quest"),
          actions: [
            IconButton(icon: const Icon(Icons.refresh), onPressed: _resetForm),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            _buildQuestionContainer(
              "Rusdi memiliki 12 buah Apel , kemudian dia memakannya 2 buah. Berapakah sisa Apel milik Rusdi ?",
              _controller1,
              'assets/img/img1.jpeg',
            ),
            _buildQuestionContainer(
              "Bisnis cukur rambut Andre sedang ramai pelanggan , hari ini ada 5 pelanggan yang datang . Jika laba setiap kedatangan pelanggan adalah 10k jadi total laba hari ini adalah ...K",
              _controller2,
              'assets/img/img2.jpeg',
            ),
            _buildQuestionContainer(
              "ke..kee..ke..ke..capppp...........mhhhhmm......(12 + 7 = ?)",
              _controller3,
              'assets/img/img3.jpeg',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _checkAnswers,
                  child: const Text("Cek Jawaban"),
                ),
                const SizedBox(width: 10),
                Text(
                  _resultText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
