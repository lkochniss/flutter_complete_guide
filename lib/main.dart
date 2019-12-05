import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  int _questionIndex = 0;
  int _totalScore = 0;

  static const _questions = [
    {
      'questionText' : 'What is your favorite color?',
      'answers' : [
        {
          'text': 'black',
          'score': 10,
        },
        {
          'text': 'red',
          'score': 6,
          },
        {
          'text': 'green',
          'score': 3,
        },
        {
          'text': 'blue',
          'score': 4
        }
      ],
    },
    {
      'questionText' : 'What is your favorite animal ?',
      'answers' : [
        {
          'text': 'rabbit',
          'score': 3,
        },
        {
          'text': 'sloth',
          'score': 9
        },
        {
          'text': 'snake',
          'score': 6,
        },
        {
          'text': 'otter',
          'score': 8
        }
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex ++;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length 
          ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          )
          : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}