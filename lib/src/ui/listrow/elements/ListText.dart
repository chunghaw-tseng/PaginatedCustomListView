import 'package:flutter/material.dart';

class ListText extends StatelessWidget {
  final String text;
  const ListText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(text),
    ));
  }
}
