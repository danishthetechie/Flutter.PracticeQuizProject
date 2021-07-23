import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //const Answer({ Key? key }) : super(ke//y: key);
  final void Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        //color: Colors.blue,
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
