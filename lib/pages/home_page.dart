import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;
  bool showResultsMessage = false;
  int correctAnswers = 0;

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is your favorite sport?',
      'answers': ['Football', 'Tennis', 'Basketball', 'Volleyball'],
      'correctAnswer': 'Football',
    },
    {
      'question': 'What is your favorite color?',
      'answers': ['Red', 'Green', 'Blue', 'White'],
      'correctAnswer': 'Blue',
    },
    {
      'question': 'What is your favorite animal?',
      'answers': ['Dog', 'Cat', 'Horse', 'Camel'],
      'correctAnswer': 'Dog',
    },
    {
      'question': 'What is your favorite sport?',
      'answers': ['Football', 'Tennis', 'Basketball', 'Volleyball'],
      'correctAnswer': 'Football',
    }
  ];

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      showResultsMessage = false;
      correctAnswers = 0;
    });
  }

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer ==
        questionsWithAnswers[questionIndex]['correctAnswer']) {
      setState(() {
        correctAnswers++;
      });
    }

    if (questionIndex < questionsWithAnswers.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      setState(() {
        showResultsMessage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionWithAnswer = questionsWithAnswers[questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: Icon(Icons.menu),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showResultsMessage == false) ...[
                Text(
                  questionWithAnswer['question'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                for (int i = 0; i < questionWithAnswer['answers'].length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          checkAnswer(questionWithAnswer['answers'][i]);
                        },
                        child: Text(questionWithAnswer['answers'][i]),
                      ),
                    ),
                  ),
              ],
              if (showResultsMessage == true) ...[
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Your score is: $correctAnswers/${questionsWithAnswers.length}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: resetQuiz,
                  child: Text('Reset Quiz'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
