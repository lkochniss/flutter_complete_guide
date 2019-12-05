import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function resetHandler;

  Result(this._totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it!';

    if (_totalScore <= 8) {
      resultText = 'You are awesome';
    } else if (_totalScore <= 12) {
      resultText = 'You are likeable';
    } else {
      resultText = 'You are strange';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton(
          child: Text('Restart Quiz'),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ],
    );
  }
}