import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//one way to write main method
// void main() {
//   runApp(ProjectA());
// }

//another way to write main method
void main() => runApp(ProjectA());

class ProjectA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectAState();
  }
}

class _ProjectAState extends State<ProjectA> {
  static const _questions = [
    {
      'questionText': 'What is your favorite color?',
      'ans': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Orange', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'ans': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorite season?',
      'ans': [
        {'text': 'Summer', 'score': 1},
        {'text': 'Winter', 'score': 10},
        {'text': 'Autumn', 'score': 3},
        {'text': 'Spring', 'score': 5}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
    print(_questionIndex);
  }

  @override //not necessary but a decorator
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To the Short Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _reset),  
      ),
      BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Color(0xFF6200EE),
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white.withOpacity(.60),
  selectedFontSize: 14,
  unselectedFontSize: 14,
  onTap: (value) {
    // Respond to item press.
  },
  items: [
    BottomNavigationBarItem(
      label: 'Favorites',
      icon: Icon(Icons.favorite),
    ),
    BottomNavigationBarItem(
      label: 'Music',
      icon: Icon(Icons.music_note),
    ),
    BottomNavigationBarItem(
      label: 'Places',
      icon: Icon(Icons.location_on),
    ),
    BottomNavigationBarItem(
      label: 'News',
      icon: Icon(Icons.library_books),
    ),
  ],
),
    );
  }
}
