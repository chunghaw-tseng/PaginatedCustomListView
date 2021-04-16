import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/footer/elements/PageItemsWidget.dart';
import 'package:paginatedlistview/src/ui/footer/elements/PageSelectorWidget.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class ListFooterWidget extends StatefulWidget {
  final int totalPages;
  final int currentPage;
  final String perPage;
  final PageChangeCallback onPageChanged;
  final ChangePerCallback onPerChangePressed;
  ListFooterWidget(
      {Key key,
      @required this.totalPages,
      @required this.currentPage,
      @required this.perPage,
      @required this.onPageChanged,
      @required this.onPerChangePressed})
      : super(key: key);

  @override
  _ListFooterWidgetState createState() => _ListFooterWidgetState();
}

class _ListFooterWidgetState extends State<ListFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PageItemsWidgets(
          perPage: widget.perPage,
          onPerPagePressed: (value) => widget.onPerChangePressed(value),
        ),
        PageSelectorWidget(
          currentPage: widget.currentPage,
          totalPages: widget.totalPages,
          onPageChanged: (value) => widget.onPageChanged(value),
        )
      ],
    );
  }
}
