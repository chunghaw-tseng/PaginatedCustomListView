import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final String title;
  final String url;
  const ListButton({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: TextButton(
        child: Text(title),
        onPressed: () {},
      ),
    ));
  }
}
