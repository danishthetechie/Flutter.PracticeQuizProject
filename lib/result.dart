import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  //const Result({Key? key}) : super(key: key);

  final int resultScore;
  final void Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'Ahan you are cool!';
    } else if (resultScore <= 12) {
      resultText = 'Mmmmmm, Not bad...';
    } else if (resultScore <= 16) {
      resultText = 'You seem like a horrible person';
    } else {
      resultText = 'You are a shady Guy';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Reset Quiz'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
