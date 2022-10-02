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
                        bool correctAnswer = quizBrain.getCorrectAnswer();

                        if (correctAnswer == true) {
                        } else {}

                        setState(() {
                          scoreKeeper.add(verifyAnswer(true));

                          quizBrain.nextQuestion();
                        });
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
                        bool correctAnswer = quizBrain.getCorrectAnswer();

                        if (correctAnswer == false) {
                        } else {}
                        setState(() {
                          scoreKeeper.add(verifyAnswer(false));

                          if (currentQuestion >=
                              quizBrain.getQuestions().length - 1) {
                            currentQuestion = 0;
                          } else {
                            currentQuestion++;
                          }
                        });
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

  Icon verifyAnswer(bool answer) {
    if (answer == quizBrain.getCorrectAnswer()) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return const Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }
}
