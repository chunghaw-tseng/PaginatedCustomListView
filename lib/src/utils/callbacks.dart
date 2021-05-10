// Defining callbacks
import 'package:paginatedlistview/paginatedlistview.dart';

typedef void PageChangeCallback(int id);
typedef void ChangePerCallback(String id);
typedef void SearchCallback(String searchKey, dynamic searchValue);
typedef void SortCallback(bool asc, int index);
typedef ListRowWidget CreateRow(int index);
