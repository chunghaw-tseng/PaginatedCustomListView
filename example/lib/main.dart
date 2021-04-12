import 'package:flutter/material.dart';
import 'package:paginatedlistview/paginatedlistview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Paginated Listview Demo'),
    );
  }
}

// Create more customizable items
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var queryData = {
    "current_page": 1,
    "total_pages": 2,
    "per_page": 10,
    "items": 10,
    "total_items": 11,
    "headers": [
      {"name": "Patient Name", "key": "patient_name"},
      {"name": "Patient ID", "key": "patient_id"},
      {"name": "Study IUID", "key": "study_iuid"},
      {"name": "Report Date", "key": "report_date"},
      {"name": "Modality", "key": "modality"},
    ],
    "data": [
      {
        "patient_name": "TestA",
        "patient_id": "10",
        "study_iuid": "123456789",
        "report_date": "2020-01-20",
        "modality": "CT"
      },
      {
        "patient_name": "TestB",
        "patient_id": "11",
        "study_iuid": "234567891",
        "report_date": "2020-01-20",
        "modality": "CT"
      },
      {
        "patient_name": "TestC",
        "patient_id": "12",
        "study_iuid": "345678912",
        "report_date": "2020-01-21",
        "modality": "CT"
      },
      {
        "patient_name": "TestD",
        "patient_id": "13",
        "study_iuid": "456789123",
        "report_date": "2020-01-21",
        "modality": "CT"
      },
      {
        "patient_name": "TestE",
        "patient_id": "14",
        "study_iuid": "567891234",
        "report_date": "2020-01-22",
        "modality": "CT"
      },
      {
        "patient_name": "TestF",
        "patient_id": "15",
        "study_iuid": "678912345",
        "report_date": "2020-01-23",
        "modality": "CT"
      },
      {
        "patient_name": "TestG",
        "patient_id": "16",
        "study_iuid": "789123456",
        "report_date": "2020-01-23",
        "modality": "CT"
      },
      {
        "patient_name": "TestH",
        "patient_id": "17",
        "study_iuid": "891234567",
        "report_date": "2020-01-24",
        "modality": "CT"
      },
      {
        "patient_name": "TestI",
        "patient_id": "18",
        "study_iuid": "912345678",
        "report_date": "2020-01-25",
        "modality": "CT"
      },
      {
        "patient_name": "TestJ",
        "patient_id": "19",
        "study_iuid": "123456780",
        "report_date": "2020-01-25",
        "modality": "CT"
      },
      {
        "patient_name": "TestK",
        "patient_id": "20",
        "study_iuid": "123456700",
        "report_date": "2020-01-26",
        "modality": "CT"
      }
    ]
  };

  ListHeaderWidget createHeader() {}

  ListRowWidget createRow() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SearchablePaginatedListView(
          pages: 3,
          currentPage: 1,
          items: 10,
          totalItems: 30,
        ),
      ),
    );
  }
}
