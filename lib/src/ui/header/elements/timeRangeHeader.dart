import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paginatedlistview/src/ui/header/elements/dateTime/datetimeSearch.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';
import 'dateTime/dateTimePicker.dart';

// 2 different types -> Click and the other text
class TimeRangeHeader extends StatefulWidget {
  final bool textSearch;
  final String label;
  final String keyName;
  final SearchCallback filterSearch;
  TimeRangeHeader(
      {Key key,
      @required this.textSearch,
      @required this.keyName,
      this.filterSearch,
      this.label})
      : super(key: key);

  @override
  _TimeRangeHeaderState createState() => _TimeRangeHeaderState();
}

class _TimeRangeHeaderState extends State<TimeRangeHeader> {
  DatetimeSearch _startTimeSearch;
  DatetimeSearch _endTimeSearch;
  var _starterror = true;
  var _enderror = true;
  final validReg = RegExp(
      r'^([0-9]{4}[-\/]?((0[13-9]|1[012])[-\/]?(0[1-9]|[12][0-9]|30)|(0[13578]|1[02])[-\/]?31|02[-\/]?(0[1-9]|1[0-9]|2[0-8]))|([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00)[-\/]?02[-\/]?29)$');

  @override
  void initState() {
    super.initState();
    if (_startTimeSearch == null) {
      _startTimeSearch = DatetimeSearch(type: Datetype.start);
    }
    if (_endTimeSearch == null) {
      _endTimeSearch = DatetimeSearch(type: Datetype.end);
    }
  }

  pickerDateSet(DatetimeSearch changedtime) {
    setState(() {
      if (changedtime.type == Datetype.start) {
        _startTimeSearch = changedtime;
        widget.filterSearch("${widget.keyName}_start", changedtime.timestamp);
      } else {
        _endTimeSearch = changedtime;
        widget.filterSearch("${widget.keyName}_end", changedtime.timestamp);
      }
    });
  }

  stringToTimestamp(String datestring) {
    return DateTime.parse(datestring).millisecondsSinceEpoch;
  }

  validateDate(String value) {
    if (value == "") {
      return true;
    }
    return validReg.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return widget.textSearch
        ? Row(
            children: [
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    setState(() {
                      _starterror = validateDate(value);
                      if (_starterror) {
                        widget.filterSearch("${widget.keyName}_start",
                            stringToTimestamp(value));
                      }
                    });
                  },
                  // TODO Add the error on top
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: widget.label,
                      hintText: "YYYYMMDD",
                      errorText: _starterror ? null : "YYYYMMDD"),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Text("-"),
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    setState(() {
                      _enderror = validateDate(value);
                      if (_enderror) {
                        widget.filterSearch(
                            "${widget.keyName}_end", stringToTimestamp(value));
                      }
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: widget.label,
                      hintText: "YYYYMMDD",
                      errorText: _enderror ? null : "YYYYMMDD"),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              )
            ],
          )
        : Row(children: [
            DateTimePicker(
              labelText: "Start Date",
              datetimeSearch: _startTimeSearch,
              compareTimestamp: _endTimeSearch.timestamp,
              notifyParent: pickerDateSet,
            ),
            Text("-"),
            DateTimePicker(
              labelText: "End Date",
              datetimeSearch: _endTimeSearch,
              compareTimestamp: _startTimeSearch.timestamp,
              notifyParent: pickerDateSet,
            )
          ]);
  }
}
