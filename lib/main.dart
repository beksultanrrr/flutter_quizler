import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
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

  _onCustomAnimationAlertPressed(context) {
    Alert(
      context: context,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      alertAnimation: fadeAlertAnimation,
    ).show();
  }

  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }


  List<Widget> scoreKeeper = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void checkAnswer(bool pickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnwer();
    bool active = quizBrain.getIsActive();
    setState(() {
      if (active == false) {
        _onCustomAnimationAlertPressed(context);
        quizBrain.reset();
        scoreKeeper.clear();
        
      } else if (pickedAnswer == correctAnswer && active == true) {
        print("not here ");
        print(active);
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else if (pickedAnswer != correctAnswer && active == true) {
        scoreKeeper.add(const Icon(
          Icons.cancel,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });
  }

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
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ))),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  bool correctAnswer = quizBrain.getQuestionAnwer();
                  checkAnswer(true);
                },
                child: const Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                  child: const Text("False",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    bool correctAnswer = quizBrain.getQuestionAnwer();
                    checkAnswer(false);
                  })),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
