import 'package:paginatedlistview/paginatedlistview.dart';
import 'package:scoped_model/scoped_model.dart';
import 'paging.dart';

class PagingListViewModel extends Model {
  Paging pageInfo = Paging(
      currentPage: 1, perPage: "10", totalItems: 30, items: 10, totalPages: 10);
  Map<String, dynamic> search = {};
  bool sortAscending = true;
  int sortIndex = 3;

  var header_data = [
    {
      "name": "Patient Name",
      "key": "patient_name",
      "width": 160.0,
      "type": HeaderType.searchable,
      "sort": SortType.ascending
    },
    {
      "name": "Patient ID",
      "key": "patient_id",
      "width": 150.0,
      "type": HeaderType.searchable,
      "sort": SortType.none,
    },
    {
      "name": "Study IUID",
      "key": "study_iuid",
      "width": 300.0,
      "type": HeaderType.searchable,
      "sort": SortType.none,
    },
    {
      "name": "Report Date",
      "key": "report_date",
      "width": 300.0,
      "type": HeaderType.date,
      "sort": SortType.none,
    },
    {
      "name": "Modality",
      "key": "modality",
      "width": 280.0,
      "type": HeaderType.selectable,
      "selection": [
        Selection(label: "DR", value: "DR"),
        Selection(label: "CT", value: "CT"),
        Selection(label: "PN", value: "PN")
      ],
      "sort": SortType.none,
    },
    {
      "name": "Status",
      "key": "phase",
      "width": 160.0,
      "type": HeaderType.selectable,
      "selection": [
        Selection(label: "Running", value: "running"),
        Selection(label: "OK", value: "ok"),
        Selection(label: "Error", value: "error")
      ],
      "sort": SortType.none,
    },
    {
      "name": "Result",
      "key": "result",
      "width": 160.0,
      "type": HeaderType.selectable,
      "selection": [
        Selection(label: "OK", value: "OK"),
        Selection(label: "Waiting", value: "Waiting"),
        Selection(label: "Error", value: "Error")
      ],
      "sort": SortType.none,
    }
  ];

  var data = [
    {
      "patient_name": "TestA",
      "patient_id": "10",
      "study_iuid": "123456789",
      "report_date": "2020-01-20",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestB",
      "patient_id": "11",
      "study_iuid": "234567891",
      "report_date": "2020-01-20",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestC",
      "patient_id": "12",
      "study_iuid": "345678912",
      "report_date": "2020-01-21",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestD",
      "patient_id": "13",
      "study_iuid": "456789123",
      "report_date": "2020-01-21",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestE",
      "patient_id": "14",
      "study_iuid": "567891234",
      "report_date": "2020-01-22",
      "modality": "CT",
      "phase": 50
    },
    {
      "patient_name": "TestF",
      "patient_id": "15",
      "study_iuid": "678912345",
      "report_date": "2020-01-23",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestG",
      "patient_id": "16",
      "study_iuid": "789123456",
      "report_date": "2020-01-23",
      "modality": "CT",
      "phase": 50,
    },
    {
      "patient_name": "TestH",
      "patient_id": "17",
      "study_iuid": "891234567",
      "report_date": "2020-01-24",
      "phase": 50,
      "modality": "CT"
    },
    {
      "patient_name": "TestI",
      "patient_id": "18",
      "study_iuid": "912345678",
      "report_date": "2020-01-25",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestJ",
      "patient_id": "19",
      "study_iuid": "123456780",
      "report_date": "2020-01-25",
      "modality": "CT",
      "phase": 50,
      "series_iuid": ["1234", "223455", "3434"]
    },
    {
      "patient_name": "TestK",
      "patient_id": "20",
      "study_iuid": "123456700",
      "report_date": "2020-01-26",
      "modality": "CT",
      "phase": 50,
      "series_iuid": []
    }
  ];

  var large_data = List.filled(50, {
    "patient_name": "TestK",
    "patient_id": "20",
    "study_iuid": "123456700",
    "report_date": "2020-01-26",
    "modality": "CT",
    "phase": 50,
    "series_iuid": []
  });

  Map<String, dynamic> getQueries() {
    return search;
  }

  void addQuery(String query, dynamic value) {
    search[query] = value;
    print(search);
    notifyListeners();
  }

  // Send sort every single time
  void updateSort(bool asc, int index) {
    sortAscending = asc;
    sortIndex = index;
    notifyListeners();
  }

  void resetSearch() {
    search = {};
    notifyListeners();
  }

  void updateItems(
      int current, String perPage, int totalPages, int totalItems, int items) {
    pageInfo = Paging(
        perPage: perPage,
        currentPage: current,
        totalPages: totalPages,
        totalItems: totalItems,
        items: items);
    notifyListeners();
  }

  void changePage(int page) {
    pageInfo.currentPage = page;
    notifyListeners();
  }

  void changePerPage(String perPage) {
    pageInfo.perPage = perPage;
    notifyListeners();
  }
}
