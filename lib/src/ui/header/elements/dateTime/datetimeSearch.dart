import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

enum Datetype { start, end }

class DatetimeSearch {
  Datetype type;
  int timestamp;
  DateTime date;
  TimeOfDay time;
  String datetimeString = "----/--/-- --:--";

  setDate(DateTime selectedDate) {
    if (selectedDate != null) {
      this.date = selectedDate;
      this.timestamp = selectedDate.millisecondsSinceEpoch;
    }
  }

  setTime(TimeOfDay selectedTime) {
    this.time = selectedTime;
    if (date == null) {
      var today = new DateTime.now();
      this.timestamp = new DateTime(today.year, today.month, today.day,
              selectedTime.hour, selectedTime.minute, 0)
          .millisecondsSinceEpoch;
    } else {
      this.timestamp = new DateTime(date.year, date.month, date.day,
              selectedTime.hour, selectedTime.minute, 0)
          .millisecondsSinceEpoch;
    }
  }

  DateTime getDate() {
    if (this.timestamp != null) {
      return new DateTime.fromMillisecondsSinceEpoch(this.timestamp);
    } else {
      return null;
    }
  }

  TimeOfDay getTime() {
    if (getDate() != null) {
      return new TimeOfDay.fromDateTime(getDate());
    }
    return null;
  }

  String getDateString() {
    if (getDate() != null) {
      var format = new DateFormat('yyyy/MM/dd');
      return format.format(getDate());
    }
    return ("----/--/--");
  }

  String getTimeString() {
    if (getDate() != null) {
      var format = new DateFormat('HH:mm');
      return format.format(getDate());
    }
    return ("--:--");
  }

  String getFullString() {
    if (getDate() != null) {
      var format = new DateFormat('yyyy/MM/dd HH:mm');
      return format.format(getDate());
    }
    return ("----/--/-- --:--");
  }

  DatetimeSearch({@required this.type, this.timestamp});
}
