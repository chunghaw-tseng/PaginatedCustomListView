import 'package:flutter/material.dart';

class PageSelectorWidget extends StatefulWidget {
  PageSelectorWidget({Key key}) : super(key: key);

  @override
  _PageSelectorWidgetState createState() => _PageSelectorWidgetState();
}

class _PageSelectorWidgetState extends State<PageSelectorWidget> {
  // Current Page
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Container(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () => {}),
            Text("10"),
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: () => {}),
          ],
        ),
      )
    ]));
  }
}
