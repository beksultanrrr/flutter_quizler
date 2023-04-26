import 'package:flutter/material.dart';
import 'package:quizler/question.dart';

void main() {
  runApp(Quizler());
}

class Quizler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ))));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _counter = 0;
  int questionNumber = 0;

  List<Widget> scoreKeeper = [];

  List<Question> questionBank = [
    Question(questionText: "hello", answer: true),
    Question(questionText: "helfd", answer: true),
    Question(questionText: "hellodfdf", answer: false),
    Question(questionText: "hellodfd3333f", answer: true),
  ];


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Question myquestion = Question(questionText: "hello", answer: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Container(
                child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ))),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  bool correctAnswer = questionBank[questionNumber].answer;
                  setState(() {
                    if (correctAnswer == true) {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ));
                    }
                    questionNumber += 1;
                  });
                }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                  child: Text("False",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    bool correctAnswer = questionBank[questionNumber].answer;
                    setState(() {
                      questionNumber += 1;
                      if (correctAnswer == false) {
                        scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      } else {
                        scoreKeeper.add(Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ));
                      }
                    });
                  })),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
