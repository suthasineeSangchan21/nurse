import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../helper/DateHelper.dart';

calendarView(context, Function onSelect, setState) {
  DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime(
          DateTime.now().year + 600, DateTime.now().month, DateTime.now().day),
      onConfirm: (date) {
    setState(() {
      onSelect(DateHelper.convertDateFormat(date));
    });
  },
      currentTime: DateTime(
          DateTime.now().year + 543, DateTime.now().month, DateTime.now().day),
      locale: LocaleType.th);
}

calendarTimeView(context, Function onSelect, setState, controller) {
  DatePicker.showTimePicker(context,
      showTitleActions: true,
      showSecondsColumn: false,
      onChanged: (date) {}, onConfirm: (date) {
    setState(() {
      controller.text =
          DateHelper.convertStringCalendarToTimeAndWithFormat(date);
    });
  }, currentTime: DateTime.now());
}