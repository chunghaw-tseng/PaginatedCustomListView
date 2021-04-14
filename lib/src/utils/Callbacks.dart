// Defining callbacks
import '../../paginatedlistview.dart';

typedef void NextPageCallback(int id);
typedef void PrevPageCallback(int id);
typedef void ChangePerCallback(String id);
typedef void SearchCallback(Map<String, dynamic> query);
typedef ListRowWidget CreateRow(int index);
typedef ListHeaderWidget CreateHeader();
