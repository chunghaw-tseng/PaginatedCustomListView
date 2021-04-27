import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class PageSelectorWidget extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final PageChangeCallback onPageChanged;

  PageSelectorWidget(
      {Key key,
      @required this.currentPage,
      @required this.totalPages,
      @required this.onPageChanged})
      : super(key: key);

  @override
  _PageSelectorWidgetState createState() => _PageSelectorWidgetState();
}

class _PageSelectorWidgetState extends State<PageSelectorWidget> {
  bool _nextPageDisabled, _prevPageDisabled;

  checkPageDisabled() {
    _nextPageDisabled =
        (widget.currentPage == widget.totalPages) ? true : false;
    _prevPageDisabled = (widget.currentPage == 1) ? true : false;
  }

  // Current Page
  @override
  Widget build(BuildContext context) {
    checkPageDisabled();
    return Container(
        child: Row(children: [
      Container(
        child: Row(
          children: [
            Text("Total ${widget.totalPages} pages"),
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed:
                    _prevPageDisabled ? null : () => widget.onPageChanged(1)),
            IconButton(
                icon: Icon(Icons.arrow_left_sharp),
                onPressed: _prevPageDisabled
                    ? null
                    : () => widget.onPageChanged(widget.currentPage - 1)),
            Text("${widget.currentPage}"),
            IconButton(
                icon: Icon(Icons.arrow_right_sharp),
                onPressed: _nextPageDisabled
                    ? null
                    : () => widget.onPageChanged(widget.currentPage + 1)),
            IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _nextPageDisabled
                    ? null
                    : () => widget.onPageChanged(widget.totalPages)),
          ],
        ),
      )
    ]));
  }
}
