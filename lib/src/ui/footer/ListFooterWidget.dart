import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/footer/elements/PageItemsWidget.dart';
import 'package:paginatedlistview/src/ui/footer/elements/PageSelectorWidget.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class ListFooterWidget extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final String perPage;
  final PageChangeCallback onPageChanged;
  final ChangePerCallback onPerChangePressed;
  const ListFooterWidget(
      {Key key,
      @required this.totalPages,
      @required this.currentPage,
      @required this.perPage,
      @required this.onPageChanged,
      @required this.onPerChangePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PageItemsWidget(
          perPage: this.perPage,
          onPerPagePressed: this.onPerChangePressed,
        ),
        PageSelectorWidget(
          currentPage: this.currentPage,
          totalPages: this.totalPages,
          onPageChanged: this.onPageChanged,
        )
      ],
    );
  }
}
