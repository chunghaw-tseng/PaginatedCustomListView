import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'datetimeSearch.dart';

/// Shows flutter in built datepicker
class DateTimePicker extends StatelessWidget {
  const DateTimePicker(
      {Key key,
      @required this.labelText,
      @required this.notifyParent,
      @required this.datetimeSearch,
      @required this.compareTimestamp})
      : super(key: key);

  final String labelText;
  final ValueChanged<DatetimeSearch> notifyParent;
  final DatetimeSearch datetimeSearch;
  final int compareTimestamp;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: this.datetimeSearch.getDate() == null
          ? new DateTime.now()
          : this.datetimeSearch.getDate(),
      firstDate: new DateTime(1970, 8),
      lastDate: new DateTime.now().add(new Duration(days: 1)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Theme.of(context).primaryColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                  headline5: TextStyle(fontSize: 20.0),
                ),
            bannerTheme: MaterialBannerThemeData(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  surface: Theme.of(context).primaryColor,
                ),
            dialogTheme: DialogTheme(titleTextStyle: TextStyle(fontSize: 15.0)),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != this.datetimeSearch.getDate()) {
      var lastDate = this.datetimeSearch.getDate();
      this.datetimeSearch.setDate(picked);
      var error = checkDatetimesearch(
          context, this.compareTimestamp, this.datetimeSearch);
      if (error != null) {
        this.datetimeSearch.setDate(lastDate);
        //TODO Return snackbar
        return;
      }
      notifyParent(this.datetimeSearch);
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: this.datetimeSearch.getTime() == null
            ? new TimeOfDay.now()
            : this.datetimeSearch.getTime());
    if (picked != null && picked != this.datetimeSearch.getTime()) {
      var lastTime = this.datetimeSearch.getTime();
      this.datetimeSearch.setTime(picked);
      var error = checkDatetimesearch(
          context, this.compareTimestamp, this.datetimeSearch);
      if (error != null) {
        this.datetimeSearch.setTime(lastTime);
        // TODO Return snackbar
        return;
      }
      notifyParent(this.datetimeSearch);
    }
  }

  checkDatetimesearch(
      BuildContext context, int compareTimestamp, DatetimeSearch currentdate) {
    if (compareTimestamp != null) {
      if (currentdate.type == Datetype.start &&
              currentdate.timestamp > compareTimestamp ||
          currentdate.type == Datetype.end &&
              currentdate.timestamp < compareTimestamp) {
        final snackbar = SnackBar(
          content: Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 30.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text("Error")
              ],
            ),
          ),
          duration: Duration(seconds: 3),
        );
        return snackbar;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Forcing the context to be portrait
    return _InputDropdown(
      labelText: labelText,
      valueText: datetimeSearch.getDateString(),
      onPressed: () {
        _selectDate(context);
      },
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key, this.child, this.labelText, this.valueText, this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    ));
  }
}
