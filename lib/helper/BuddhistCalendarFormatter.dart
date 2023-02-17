import 'package:intl/intl.dart';

extension BuddhistCalendarFormatter on DateFormat {
  String formatInBuddhistCalendarThai(DateTime dateTime) {
    if (this.pattern!.contains('y')) {
      var buddhistDateTime = DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond);

      if (this.locale.contains('th') || this.locale.contains('TH')) {
        var normalYear = buddhistDateTime.year;
        var dateTimeString =
            this.format(buddhistDateTime).replaceAll('ค.ศ.', 'พ.ศ.');
        dateTimeString = dateTimeString.replaceAll(
            normalYear.toString(), (normalYear + 543).toString());
        return dateTimeString;
      } else {
        var result = this.format(buddhistDateTime);
        return result;
      }
    }
    return this.format(dateTime);
  }
}