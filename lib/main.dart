import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question_bank.dart';

void main() {
  runApp(MyApp());
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key}) : super(key: key);

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  List<Widget> scoreKeeper = [];
  QuestionBank q1 = QuestionBank();
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              '$correctAnswers',
                            ),
                            const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                '$incorrectAnswers'
                            ),
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      q1
                          .getQuestions()
                          .question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton( //True
                  onPressed: () { //True
                    setState(() {
                      checkAnswers(true,context);
                      q1.increaseQNum();
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(10),
                      textStyle: const TextStyle(
                          color: Colors.white
                      )
                  ),
                  child: const Text('True',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        letterSpacing: 1
                    ),
                  ),

                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton( //false
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(
                            color: Colors.white
                        )
                    ),
                    onPressed: () { //false
                      setState(() {
                        checkAnswers(false,context);
                        q1.increaseQNum();
                      });
                    },
                    child: const Text('False',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1
                      ),
                    )
                ),
              ),
            ),
            Row(
                children: scoreKeeper
            ),
          ],
        ),
      ),
    );
  }


  void checkAnswers(bool check, BuildContext context) {
    if ((correctAnswers+incorrectAnswers)<q1.getListLength()) {
      if (q1.getQuestions().answer == check) {
        scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            )
        );
        correctAnswers++;
      }
      else {
        scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            )
        );
        incorrectAnswers++;
      }
    }
    else {
      int totalQuestion=q1.getListLength();
      setState(() {
        Alert(
          type: AlertType.warning,
          context: context,
          title: 'ALERT',
          desc: 'You have reached at the end of quiz.\nTotal Score: $correctAnswers/$totalQuestion',
        ).show();
      });
    }
  }
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}