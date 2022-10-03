import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quizz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();
    });
  }

  List<bool> answers = [false, true, true];

  int currentQuestion = 0;

  bool currentAnswer = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 27.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(3.0)),
                        child: const Center(
                          child: Text(
                            'True',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3.0)),
                        child: const Center(
                          child: Text(
                            'False',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
