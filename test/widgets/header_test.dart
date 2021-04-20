import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paginatedlistview/paginatedlistview.dart';
import 'package:paginatedlistview/src/ui/main/mainWidget.dart';

void main() {
  group('Header Widget Tests', () {
    testWidgets('TestSortHeader', (WidgetTester tester) async {
      bool ascending = false;
      await tester.pumpWidget(
        MaterialApp(
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
                  sortAscending: ascending,
                  totalItems: 1,
                  items: 1,
                  currentPage: 1,
                  totalpages: 1,
                  rows: [
                    ListRowWidget(cells: [
                      ListItem(child: Text("Item")),
                    ]),
                  ],
                  onSort: (asc, index) {
                    setState(() {
                      ascending = asc;
                    });
                  });
            }),
          ),
        ),
      );

      var headerField = find.byType(TextButton);
      var ascendingIcon = find.byIcon(Icons.arrow_drop_up_outlined);
      var descendingIcon = find.byIcon(Icons.arrow_drop_down_outlined);
      expect(descendingIcon, findsOneWidget);
      await tester.tap(headerField);
      await tester.pump();
      expect(ascending, true);
      expect(ascendingIcon, findsOneWidget);
    });
  });
  group('Header Widget Tests', () {
    testWidgets('TestSearchHeader', (WidgetTester tester) async {
      var result;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchablePaginatedListView(
                headers: [
                  Header(
                      label: "Search",
                      searchField: SearchableHeader(
                          filterSearch: (key, value) {
                            result = value;
                          },
                          label: "Test",
                          keyName: "test"),
                      headerKey: "test")
                ],
                sortIndex: 0,
                sortAscending: false,
                totalItems: 1,
                items: 1,
                currentPage: 1,
                totalpages: 1,
                rows: [
                  ListRowWidget(cells: [
                    ListItem(child: Text("Item")),
                  ]),
                ],
                onSort: (asc, index) {}),
          ),
        ),
      );

      var headerField = find.byType(TextButton);

      expect(find.text("Search"), findsOneWidget);
      expect(headerField, findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text("Item"), findsOneWidget);
      await tester.enterText(find.byType(TextField), "abc");
      TextField textField = tester.widget(find.byType(TextField));
      textField.onSubmitted(textField.controller.value.text);
      expect(find.text('abc'), findsOneWidget);
      expect(result, 'abc');
    });

    testWidgets('TestSelectableHeader', (WidgetTester tester) async {
      var data;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SearchablePaginatedListView(
                headers: [
                  Header(
                      label: "Select",
                      searchField: SelectableHeader(
                        filterSearch: (key, value) {
                          data = value;
                        },
                        label: "Test",
                        keyName: "test",
                        selection: ["A"],
                      ),
                      headerKey: "test")
                ],
                sortIndex: 0,
                sortAscending: false,
                totalItems: 1,
                items: 1,
                currentPage: 1,
                totalpages: 1,
                rows: [
                  ListRowWidget(cells: [
                    ListItem(child: Text("Item")),
                  ]),
                ],
              );
            }),
          ),
        ),
      );

      var dropdownField = find.byType(PopupMenuButton);
      var headerField = find.byType(TextButton);

      expect(find.text("Select"), findsOneWidget);
      expect(headerField, findsOneWidget);
      expect(dropdownField, findsOneWidget);
      await tester.tap(dropdownField);
      await tester.pumpAndSettle();
      expect(find.byKey(Key("A")), findsOneWidget);

      CheckboxListTile checkboxA = tester.widget(find.byType(CheckboxListTile));
      expect(checkboxA.value, false);
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();
      expect(data, ["A"]);
    });

    testWidgets('TestErrorTextTimeRangeHeader', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchablePaginatedListView(
              headers: [
                Header(
                    label: "Select",
                    searchField: TimeRangeHeader(
                      textSearch: true,
                      filterSearch: (key, value) {},
                      keyName: "test",
                    ),
                    headerKey: "test")
              ],
              sortIndex: 0,
              sortAscending: false,
              totalItems: 1,
              items: 1,
              currentPage: 1,
              totalpages: 1,
              rows: [
                ListRowWidget(cells: [
                  ListItem(child: Text("Item")),
                ]),
              ],
            ),
          ),
        ),
      );

      expect(find.text("Start Date"), findsOneWidget);
      expect(find.text("End Date"), findsOneWidget);
      expect(find.text("-"), findsOneWidget);
      final Finder startFinder = find.byKey(Key("START_KEY"));
      final Finder endFinder = find.byKey(Key("END_KEY"));
      expect(startFinder, findsOneWidget);
      expect(endFinder, findsOneWidget);
      await tester.enterText(startFinder, "20103939");
      final TextField startDateField = tester.widget(startFinder) as TextField;
      startDateField.onSubmitted(startDateField.controller.value.text);
      expect(find.text("YYYYMMDD"), findsWidgets);
    });

    testWidgets("TestTextTimeRangeHeader", (WidgetTester tester) async {
      var data;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchablePaginatedListView(
              headers: [
                Header(
                    label: "Select",
                    searchField: TimeRangeHeader(
                      textSearch: true,
                      filterSearch: (key, value) {
                        data = value;
                      },
                      keyName: "test",
                    ),
                    headerKey: "test")
              ],
              sortIndex: 0,
              sortAscending: false,
              totalItems: 1,
              items: 1,
              currentPage: 1,
              totalpages: 1,
              rows: [
                ListRowWidget(cells: [
                  ListItem(child: Text("Item")),
                ]),
              ],
            ),
          ),
        ),
      );

      final Finder startFinder = find.byKey(Key("START_KEY"));
      final Finder endFinder = find.byKey(Key("END_KEY"));
      expect(startFinder, findsOneWidget);
      expect(endFinder, findsOneWidget);
      await tester.enterText(startFinder, "20101029");
      final TextField startDateField = tester.widget(startFinder) as TextField;
      startDateField.onSubmitted(startDateField.controller.value.text);
      expect(data, DateTime.parse("20101029").millisecondsSinceEpoch);
      await tester.enterText(endFinder, "20201029");
      final TextField endDateField = tester.widget(endFinder) as TextField;
      endDateField.onSubmitted(endDateField.controller.value.text);
      expect(data, DateTime.parse("20201029").millisecondsSinceEpoch);
    });
  });
}
