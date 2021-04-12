import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class PageSelectorWidget extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final NextPageCallback onNextPagePressed;
  final PrevPageCallback onPrevPagePressed;

  PageSelectorWidget(
      {Key key,
      @required this.currentPage,
      @required this.totalPages,
      @required this.onNextPagePressed,
      @required this.onPrevPagePressed})
      : super(key: key);

  @override
  _PageSelectorWidgetState createState() => _PageSelectorWidgetState();
}

// TODO The limits of the pages
class _PageSelectorWidgetState extends State<PageSelectorWidget> {
  // Current Page
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Container(
        child: Row(
          children: [
            Text("Total ${widget.totalPages} pages"),
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => widget.onPrevPagePressed(1)),
            IconButton(
                icon: Icon(Icons.arrow_left_sharp),
                onPressed: () =>
                    widget.onPrevPagePressed(widget.currentPage - 1)),
            Text("${widget.currentPage}"),
            IconButton(
                icon: Icon(Icons.arrow_right_sharp),
                onPressed: () =>
                    widget.onNextPagePressed(widget.currentPage + 1)),
            IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () => widget.onNextPagePressed(widget.totalPages)),
          ],
        ),
      )
    ]));
  }
}
