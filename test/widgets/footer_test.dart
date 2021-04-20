import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paginatedlistview/paginatedlistview.dart';

void main() {
  group("Pagination", () {
    testWidgets('Pagination Tests', (WidgetTester tester) async {
      var _currentPage = 1;
      final lastPage = 10;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SearchablePaginatedListView(
                headers: [
                  Header(
                      label: "Search",
                      searchField: SearchableHeader(
                          filterSearch: (key, value) {},
                          label: "Test",
                          keyName: "test"),
                      headerKey: "test")
                ],
                sortIndex: 0,
                sortAscending: true,
                totalItems: 1,
                items: 1,
                currentPage: _currentPage,
                totalpages: lastPage,
                rows: [
                  ListRowWidget(cells: [
                    ListItem(child: Text("Item")),
                  ]),
                ],
                onPageChange: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                onSort: (asc, index) {});
          }),
        ),
      ));

      var nextIcon = find.byIcon(Icons.arrow_right_sharp);
      var lastPageIcon = find.byIcon(Icons.arrow_forward);
      var prevIcon = find.byIcon(Icons.arrow_left_sharp);
      var firstPageIcon = find.byIcon(Icons.arrow_back);

      expect(find.text("1"), findsOneWidget);
      expect(nextIcon, findsOneWidget);
      expect(lastPageIcon, findsOneWidget);
      expect(prevIcon, findsOneWidget);
      expect(firstPageIcon, findsOneWidget);
      await tester.tap(nextIcon);
      await tester.pump();
      expect(_currentPage, 2);
      await tester.tap(lastPageIcon);
      await tester.pump();
      expect(_currentPage, lastPage);
      await tester.tap(prevIcon);
      await tester.pump();
      expect(_currentPage, lastPage - 1);
      await tester.tap(firstPageIcon);
      await tester.pump();
      expect(_currentPage, 1);
    });
  });

  group("PerPage", () {
    testWidgets('PerPageWidget Tests', (WidgetTester tester) async {
      var _perPage = "10";
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SearchablePaginatedListView(
                headers: [
                  Header(
                      label: "Search",
                      searchField: SearchableHeader(
                          filterSearch: (key, value) {},
                          label: "Test",
                          keyName: "test"),
                      headerKey: "test")
                ],
                sortIndex: 0,
                sortAscending: true,
                totalItems: 100,
                items: 50,
                perPage: _perPage,
                currentPage: 1,
                totalpages: 10,
                rows: [
                  ListRowWidget(cells: [
                    ListItem(child: Text("Item")),
                  ]),
                ],
                onPerChangePressed: (String page) {
                  setState(() {
                    _perPage = page;
                  });
                },
                onSort: (asc, index) {});
          }),
        ),
      ));

      expect(
          (tester.widget(find.byKey(Key('PER_PAGE'))) as DropdownButton).value,
          equals('10'));
      await tester.tap(find.byKey(Key('PER_PAGE')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("50")).last);
      await tester.pumpAndSettle();
      expect(find.text("50"), isNotNull);
      expect(
          (tester.widget(find.byKey(Key('PER_PAGE'))) as DropdownButton).value,
          equals('50'));
      expect(_perPage, "50");
    });
  });
}
